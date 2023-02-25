resource "aws_vpc" "my-vpc" {
  cidr_block = "200.168.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "my-vpc"
  }
}
resource "aws_subnet" "web-subnet" {
  cidr_block = "200.168.10.0/24"
  vpc_id = "${aws_vpc.my-vpc.id}"
  #availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "200.168.10.0"
  }
}
resource "aws_subnet" "db-subnet" {
  cidr_block = "200.168.20.0/24"
  vpc_id = "${aws_vpc.my-vpc.id}"
  #availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "200.168.20.0"
  }
}
