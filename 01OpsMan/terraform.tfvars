ami-id = "ami-0310483fb2b488153"
om-instance-type = "r5.large"
ansible-instance-type = "t3.medium"
key-pair = "sydneyKeyPair"
vpc-name = "tf-om-vpc"
region = "ap-southeast-2"
subnet-cidrs = ["192.168.0.0/28", "192.168.0.16/28", "192.168.0.32/28"]
sg-ingress-ports = [ 
                     [22,22,"tcp",["0.0.0.0/0"]], [80,80,"tcp",["0.0.0.0/0"]], 
                     [8443,8443,"tcp",["0.0.0.0/0"]], 
                     [8080,8080,"tcp",["0.0.0.0/0"]], [27017,27017,"tcp",["0.0.0.0/0"]]
                   ]