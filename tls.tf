
module "tls-keys" {
  source = "modules/private-tls-cert"
  ca_public_key_file_path = "keys/vault/ca.crt"
  public_key_file_path    = "keys/vault/vault.crt"
  private_key_file_path   = "keys/vault/vault.key"
  owner                   = "juhaniatula"
  organization_name       = "Super Ops Oy"
  ca_common_name          = "Vault Root CA"
  common_name             = "vault"
  dns_names               = ["vault.useless.mobi"]
  ip_addresses            = ["127.0.0.1"]
  validity_period_hours   = 87600
  private_key_rsa_bits    = 4096
}