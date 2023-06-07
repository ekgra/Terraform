
output "vpc-azs" {
  value = data.aws_availability_zones.om-vpc-azs.names
}

output "vpc-subnets" {
  value = [for subnet in aws_subnet.om-vpc-subnet: subnet.id ]
}

output "om-public-ips" {
  value = [for instance in aws_instance.om-node: instance.public_ip]
}
