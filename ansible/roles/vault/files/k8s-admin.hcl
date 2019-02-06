# Work with kv secrets engine
path "secret/*" {
  capabilities = [ "read", "list" ]
}

path "sys/leases/renew" {
  capabilities = ["create"]
}
path "sys/leases/revoke" {
  capabilities = ["update"]
}