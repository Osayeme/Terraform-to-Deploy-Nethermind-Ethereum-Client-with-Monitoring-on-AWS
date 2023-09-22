variable "num" {
  description = "Number of VM's with preconfigured Nethermind Docker environment to create"
}


# variable "client_count" {
#   description = "Number of Nethermind clients which will be running on each VM (e.g. --scale nethermind=5)"
#   type = number
# }

variable "config" {
  description = "Chain on which Nethermind will be running"
  type = string
}

variable "rpc_enabled" {
  description = "Specify whether JSON RPC should be enabled"
  type = bool
}