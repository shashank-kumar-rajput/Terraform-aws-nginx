# Defining the route table for web subnet
resource "aws_route_table" "webzone-rt" {
  vpc_id = "${aws_vpc.my-vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.my-internet-gw.id}"
  }
  tags = {
    Name = "webzone route"
  }
}
# Associating the web subnet
resource "aws_route_table_association" "web-rt-association" {
  route_table_id = "${aws_route_table.webzone-rt.id}"
  subnet_id = "${aws_subnet.web-subnet.id}"
}
# Defining the route table for private subnet
resource "aws_route_table" "dbzone-rt" {
  vpc_id = "${aws_vpc.my-vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.my-nat-gw.id}"
  }
  tags = {
    Name = "DB zone route"
  }
}
# Associating the DB subnet to the NAT exposed route table
resource "aws_route_table_association" "db-rt-association" {
  route_table_id = "${aws_route_table.dbzone-rt.id}"
  subnet_id = "${aws_subnet.db-subnet.id}"
}
