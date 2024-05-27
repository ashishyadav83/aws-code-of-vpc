provider "aws" {
  region = "us-east-2"
}
variable "cidr_block" {
  type = string
  default = ""
}
variable "enable" {
  type = bool
  default = true
}
variable "instance_tenancy" {
  type = string
  default = ""
}
variable "name" {
  type = string
  default = ""
}
variable "subnet_cidr_block" {
  type = string
  default = ""
}
