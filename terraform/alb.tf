resource "aws_lb" "workshop-lb" {
  name            = "workshop-lb"
  internal           = false
  load_balancer_type = "application"
  subnets         = [aws_default_subnet.default_workshop_subnet_a.id, aws_default_subnet.default_workshop_subnet_b.id, aws_default_subnet.default_workshop_subnet_c.id]
  security_groups = [aws_security_group.workshop_lb_security_group.id]
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.workshop-lb.arn # Referencing our load balancer
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.green.arn # Referencing our target group
  }

#this lyfecicle rule should be added to not change the target group every time we apply
  lifecycle {
    ignore_changes         = [default_action]
  }
}

resource "aws_lb_target_group" "blue" {
  name        = "blue-target-group"
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"
  deregistration_delay  = 30
  slow_start = 30
  vpc_id      = aws_default_vpc.default_workshop_vpc.id # Referencing the default VPC

  health_check {
    interval = 15
    healthy_threshold = 2
    matcher = "200,301,302"
    path = "/"
  }
}

resource "aws_lb_target_group" "green" {
  name        = "green-target-group"
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"
  deregistration_delay  = 30
  slow_start = 30
  vpc_id      = aws_default_vpc.default_workshop_vpc.id # Referencing the default VPC

  health_check {
    interval = 15
    healthy_threshold = 2
    matcher = "200,301,302"
    path = "/"
  }
}
