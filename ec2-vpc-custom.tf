resource "aws_instance" "web-server" {
 ami = "${var.ami_linux}"
 instance_type= "${var.ec2_instance_type1}"
 key_name="${aws_key_pair.key-tf.key_name}"
  subnet_id = "${aws_subnet.web-subnet.id}"
  #user_data = "${file("httpd.sh")}"
  vpc_security_group_ids = ["${aws_security_group.web-sg.id}"]
  
  tags = {
    Name = "web-server"
  }
}
resource "aws_instance" "db-server" {
   ami = "${var.ami_linux}"
 instance_type= "${var.ec2_instance_type1}"
 key_name="${aws_key_pair.key-tf.key_name}"
  subnet_id = "${aws_subnet.db-subnet.id}"
  associate_public_ip_address = false
  vpc_security_group_ids = ["${aws_security_group.db-sg.id}"]
  
  tags = {
    Name = "db-server"
  }
}