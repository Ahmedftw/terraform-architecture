/*resource "aws_alb" "alb" {
  name            = "ALB"
  internal        = true
  security_groups = ["${aws_security_group.web_serv_sg.id}"]
  subnets         = ["${aws_subnet.private_subnet.*.id}"]

  tags {
    Environment = "${var.project_name}_ALB"
  }
}

resource "aws_alb_target_group" "alb_targets" {
  count    = "${length(var.azs[var.region])}"
  name     = "TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.main.id}"

  health_check {
    healthy_threshold   = 2
    interval            = 15
    path                = "/"
    timeout             = 10
    unhealthy_threshold = 2
  }

  tags {
    Name = "${var.project_name}_TG"
  }
}

resource "aws_elb_attachment" "baz" {
  elb      = "${aws_alb.alb.id}"
  instance = "${aws_instance.web_host.*.id[count.index]}"
}
*/