resource "aws_db_instance" "default" {
  identifier           = "workshop-db"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "demo"
  username             = "demo_user"
  password             = "demo_pass"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [ aws_security_group.ecs_security_group.id, ]
}
