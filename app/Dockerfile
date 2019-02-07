FROM golang:1.11.5-alpine
RUN apk update && apk add git 
WORKDIR /opt/app
ADD . .
RUN touch /tmp/server.pid && \
    go get github.com/gorilla/websocket && \
    go get github.com/lucasb-eyer/go-colorful && \
    cd server && \
    go build

EXPOSE 9393
ENTRYPOINT [ "sh", "-c", ". /opt/secrets/.env && env | grep SECRET && ./server/server -port 9393 echo $$! > /tmp/server.pid" ]