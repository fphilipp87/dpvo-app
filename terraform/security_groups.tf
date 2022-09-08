resource "aws_security_group" "ecs_security_group" {
  name = "ecs_security_group"

  ingress {
    from_port   = 8080 # Allowing traffic in only from load balancer security group
    to_port     = 8080
    protocol    = "tcp"
    security_groups  = [aws_security_group.workshop_lb_security_group.id]
  }

  ingress {
    from_port   = 3306 # Allowing traffic in only from load balancer security group
    to_port     = 3306
protocol    = "tcp"
    cidr_blocks = [aws_default_vpc.default_workshop_vpc.cidr_block]
#    cidr_blocks = ["172.31.0.0/16"] # Allow traffic to database only from within default subnets
  }

  egress {
    from_port   = 0 # Allowing any incoming port
    to_port     = 0 # Allowing any outgoing port
    protocol    = "-1" # Allowing any outgoing protocol 
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
  }
}

resource "aws_security_group" "workshop_lb_security_group" {

  ingress {
    from_port   = 80 # Allowing traffic in from port 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic in from all sources
  }

  egress {
    from_port   = 0 # Allowing any incoming port
    to_port     = 0 # Allowing any outgoing port
    protocol    = "-1" # Allowing any outgoing protocol 
    cidr_blocks = ["0.0.0.0/0"] # Allowing traffic out to all IP addresses
  }
}


