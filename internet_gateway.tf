# Defining the VPC Internet Gateway
resource "aws_internet_gateway" "my-internet-gw" {
  vpc_id = "${aws_vpc.my-vpc.id}"
  tags = {
    Name = "my-internet-gw"
  }
}
# Defining the Elastic IP Address for NAT
resource "aws_eip" "nat" {
  vpc = true
}
# Defining the VPC NAT Gateway
resource "aws_nat_gateway" "my-nat-gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.web-subnet.id}"
  depends_on = [aws_internet_gateway.my-internet-gw]
  tags = {
    Name = "my nat gateway"
  }
}