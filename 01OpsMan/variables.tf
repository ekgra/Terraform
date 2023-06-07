variable "region" {
  type    = string
}

variable "vpc-name" {
  type    = string
}

variable "om-instance-type" {
  type    = string
}

variable "ansible-instance-type" {
  type    = string
}

variable "ami-id" {
  type = string
}

variable "key-pair" {
  type = string
}

variable "subnet-cidrs"{
  type = list(string)
}

variable "sg-ingress-ports" {
  type = list(any)
}