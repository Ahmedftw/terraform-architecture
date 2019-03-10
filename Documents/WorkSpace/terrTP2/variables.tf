### Variables
variable project_name {
  default = "training-terraform"
}

variable region {
  default = "eu-west-1"
}

variable "azs" {
  default = {
    "eu-west-1" = ["eu-west-1a", "eu-west-1b"]
  }
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "ami" {
  default = "ami-08935252a36e25f85"
}

variable "key_path" {
  description = "SSH Public Key path"

  # default     = "/Users/ahmed.lachheb/.ssh/keypair.pub"
  default = "AhmedKeyPair"
}

variable "sg_name" {
  type    = "list"
  default = ["webServer_sg", "LB_sg"]
}
