output "database_endpoint" {
  value = aws_db_instance.default.endpoint
}
/*
output "lb_adress" {
  value = aws_lb.workshop-lb.dns_name
}
*/
