package main

import (
	"encoding/json"
	"fmt"
	"log"
	"sync"
)

// A Client is a connected player and associated websocket connection.
type Client struct {
	// WebSocket connection (communicate with this via send and receive channels)
	conn *Connection

	// ID of the player that this client represents
	playerId string

	// ID of the last applied event
	lastAppliedEventId uint64

	// Time of last sent game state
	lastUpdateTime   uint64
	lastUpdateTimeMu sync.Mutex
}

func makeClient(conn *Connection) *Client {
	c := &Client{conn: conn}
	game.register <- c
	return c
}

func (c *Client) Initialize(playerId string, gameConstants *GameConstants, gameState *GameState) {
	c.playerId = playerId

	// send initial player data to client
	b, err := json.Marshal(&InitData{playerId, gameConstants, gameState})
	if err != nil {
		log.Println("Error marshalling initial state", err)
		return
	}
	raw := json.RawMessage(b)
	c.Send(&Message{Type: "init", Time: MakeTimestamp(), Data: &raw})

	log.Println(fmt.Sprintf("Client Starting: %v", c.playerId))

	// update last seen game state
	c.setLastUpdateTime(gameState.Time)

	// boot client message handler
	go c.run()
}

func (c *Client) run() {
	defer func() {
		game.unregister <- c
		close(c.conn.send)
	}()

	for {
		select {
		case message, ok := <-c.conn.receive:
			if !ok {
				log.Println(fmt.Sprintf("Client Stopping: %v", c.playerId))
				game.history.Run(&RemoveShipEvent{MakeTimestamp(), c.playerId})
				return
			}
			c.handleMessage(message)
		}
	}
}

func (c *Client) handleMessage(message *Message) {
	switch message.Type {
	case "h":
		// received heartbeat, that means we should send an update
		state := game.history.CurrentState()
		c.SendUpdate(state)
	case "changeAcceleration":
		var data AccelerationData
		err := json.Unmarshal([]byte(*message.Data), &data)
		if err != nil {
			log.Println("Error unpacking event data", err)
			return
		}
		game.history.Run(&ChangeAccelerationEvent{message.Time, c.playerId, data.Direction})
		c.updateLastAppliedEvent(data.EventId)
	case "changeRotation":
		var data RotationData
		err := json.Unmarshal([]byte(*message.Data), &data)
		if err != nil {
			log.Println("Error unpacking event data", err)
			return
		}
		game.history.Run(&ChangeRotationEvent{message.Time, c.playerId, data.Direction})
		c.updateLastAppliedEvent(data.EventId)
	case "fire":
		var data FireData
		err := json.Unmarshal([]byte(*message.Data), &data)
		if err != nil {
			log.Println("Error unpacking event data", err)
			return
		}
		game.history.Run(&FireEvent{message.Time, c.playerId, data.ProjectileId, data.Created})
		c.updateLastAppliedEvent(data.EventId)
	}

}

func (c *Client) updateLastAppliedEvent(eventId uint64) {
	if eventId > c.lastAppliedEventId {
		c.lastAppliedEventId = eventId
	} else {
		log.Printf("Client got out-of-order event id: %d, %d", c.lastAppliedEventId, eventId)
		return
	}
}

func (c *Client) SendUpdate(state *GameState) {
	b, err := json.Marshal(&UpdateData{state, c.lastAppliedEventId})
	if err != nil {
		log.Println("Error marshalling update", err)
		return
	}

	raw := json.RawMessage(b)
	c.Send(&Message{Type: "update", Time: MakeTimestamp(), Data: &raw})

	// update last seen game state
	c.setLastUpdateTime(state.Time)
}

func (c *Client) Send(message *Message) {
	c.conn.send <- message
}

func (c *Client) setLastUpdateTime(t uint64) {
	c.lastUpdateTimeMu.Lock()
	defer c.lastUpdateTimeMu.Unlock()
	c.lastUpdateTime = t
}

func (c *Client) LastUpdateTime() uint64 {
	c.lastUpdateTimeMu.Lock()
	defer c.lastUpdateTimeMu.Unlock()
	return c.lastUpdateTime
}
