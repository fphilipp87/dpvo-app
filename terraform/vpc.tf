resource "aws_default_vpc" "default_workshop_vpc" {
}

# Providing a reference to our default subnets
resource "aws_default_subnet" "default_workshop_subnet_a" {
  availability_zone = "eu-central-1a"
}

resource "aws_default_subnet" "default_workshop_subnet_b" {
  availability_zone = "eu-central-1b"
}

resource "aws_default_subnet" "default_workshop_subnet_c" {
  availability_zone = "eu-central-1c"
}
