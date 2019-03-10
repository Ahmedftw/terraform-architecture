# Define SSH key pair for our instances

resource "aws_instance" "bastion_Host" {
  ami                         = "${var.ami}"
  instance_type               = "t2.micro"
  key_name                    = "${var.key_path}"
  subnet_id                   = "${aws_subnet.public_subnet.*.id[count.index]}"
  vpc_security_group_ids      = ["${aws_security_group.bastion_sg.*.id[count.index]}"]
  associate_public_ip_address = true
  source_dest_check           = false

  #user_data                   = "${file("install.sh")}"

  tags {
    Name = "${var.project_name}_Bastion-Host"
  }
}

resource "aws_instance" "web_host" {
  count                  = "${length(var.azs[var.region])}"
  ami                    = "${var.ami}"
  instance_type          = "t2.micro"
  key_name               = "${var.key_path}"
  subnet_id              = "${aws_subnet.private_subnet.*.id[count.index]}"
  vpc_security_group_ids = ["${aws_security_group.web_serv_sg.id}"]
  source_dest_check      = false
  user_data              = "${file("install.sh")}"

  tags {
    Name = "${var.project_name}_WebServer_${count.index}"
  }
}

/*
##LOAD BALANCER
resource "aws_lb" "lb" {
  name               = "${var.project_name}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.web_serv_sg.*.id[count.index]}"]
  subnets            = ["${aws_subnet.private_subnet.*.id}"]

  enable_deletion_protection = false

  tags = {
    Name = "${var.project_name}_ALB"
  }
}

resource "aws_elb_attachment" "baz" {
  elb      = "${aws_lb.lb.id}"
  instance = "${aws_instance.web_host.*.id[count.index]}"
}
*/

