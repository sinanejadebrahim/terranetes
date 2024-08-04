
variable "master_count" {
  description = "Number of master servers"
  type        = number
}

variable "worker_count" {
  description = "Number of worker servers"
  type        = number
}

variable "server_type" {
  description = "Type of the server (e.g., cx11, cx21)"
  type        = string
  default     = "cx32"
}

variable "ssh_keys" {
  description = "List of SSH key IDs to deploy on the servers"
  type        = list(string)
  default     = ["user1", "user2"]
}

variable "image" {
  type    = string
  default = "ubuntu-22.04"
}

variable "location" {
  type    = string
  default = "nbg1"
}
