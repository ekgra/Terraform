resource "aws_vpc" "kuber-vpc" {
  provider             = aws.provider
  cidr_block           = "192.168.0.0/20"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.vpc-name
  }
}

resource "aws_internet_gateway" "kuber-vpc-igw" {
  provider = aws.provider
  vpc_id   = aws_vpc.kuber-vpc.id
}

data "aws_availability_zones" "kuber-vpc-azs" {
  provider = aws.provider
  state    = "available"
}

resource "aws_subnet" "kuber-subnet" {
  provider          = aws.provider
  availability_zone = element(data.aws_availability_zones.kuber-vpc-azs.names, 0)
  vpc_id            = aws_vpc.kuber-vpc.id
  cidr_block        = "192.168.0.0/28"
}


resource "aws_route_table" "kuber-rtbl" {
  provider = aws.provider
  vpc_id   = aws_vpc.kuber-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kuber-vpc-igw.id
  }
  lifecycle {
    ignore_changes = all
  }
  tags = {
    Name = "kuber-rtbl"
  }
}

resource "aws_main_route_table_association" "rtbl_assoc_main" {
  provider       = aws.provider
  vpc_id         = aws_vpc.kuber-vpc.id
  route_table_id = aws_route_table.kuber-rtbl.id
}

resource "aws_route_table_association" "rtbl_assoc_subnet" {
  provider       = aws.provider
  subnet_id      = aws_subnet.kuber-subnet.id
  route_table_id = aws_route_table.kuber-rtbl.id
}