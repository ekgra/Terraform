
# output "vpc-azs" {
#   value = data.aws_availability_zones.om-vpc-azs.names
# }

# output "vpc-subnets" {
#   value = [for subnet in aws_subnet.om-vpc-subnet: subnet.id ]
# }

# output "om-node-ips" {
#   value = {
#     "public" : [for instance in aws_instance.om-node : instance.public_ip],
#     "private" : [for instance in aws_instance.om-node : instance.private_ip],
#     "fqdn" : [for dnsRecord in aws_route53_record.om-node-public-dns-record : dnsRecord.fqdn]
#   }
# }

locals {
  enum-om-node-fqdn = zipmap(
    range(length(aws_route53_record.om-node-public-dns-record)),
    [for dnsRecord in aws_route53_record.om-node-public-dns-record : dnsRecord.fqdn]
  )
}

output "nodes" {
  value = local.enum-om-node-fqdn
}
resource "local_file" "ansible-inventory" {
  filename = "./ansible_vars"
  content  = <<DOC
%{for index, fqdn in local.enum-om-node-fqdn~}
om${index} ansible_host=${fqdn} ansible_port=22 ansible_user=ubuntu ansible_connection=ssh hostname=${substr(fqdn, 2, length(fqdn))}
%{endfor~}

[om_servers]
%{for index, fqdn in local.enum-om-node-fqdn~}
om${index}
%{endfor~}
DOC

}






# output "lb-node-ips" {
#   value = {
#     "public" : aws_instance.lb-node.public_ip,
#     "private" : aws_instance.lb-node.private_ip
#   }
# }


