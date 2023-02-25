# Security Group for web subnet
resource "aws_security_group" "web-sg" {
  name = "web-sg"
  description = "Allow HTTP/SSH Access"
  vpc_id = "${aws_vpc.my-vpc.id}"
  tags = {
    Name = "web sg"
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "db-sg" {
  name = "db-sg"
  description = "DB zone Access"
  vpc_id = "${aws_vpc.my-vpc.id}"
  tags = {
    Name = "db sg"
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [aws_subnet.web-subnet.cidr_block]
  }
  
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [aws_subnet.web-subnet.cidr_block]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
