variable "region" {
  type    = string
  default = "ap-southeast-2"
}

variable "vpc-name" {
  type    = string
  default = "k-vpc"
}

variable "instance-type" {
  type    = string
  default = "t3.micro"
}
