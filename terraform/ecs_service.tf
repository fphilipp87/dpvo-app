resource "aws_ecs_service" "service-bluegreen" {
  name            = "service-bluegreen"      # Naming our first service
  cluster         = "dpvo-app"         # Referencing our created Cluster
  task_definition = aws_ecs_task_definition.workshop_app_task.arn  # Referencing the task our service will spin up
  launch_type     = "FARGATE"
  desired_count   = 1 # Setting the number of containers we want deployed to 1

  network_configuration {
    subnets          = [aws_default_subnet.default_workshop_subnet_a.id, aws_default_subnet.default_workshop_subnet_b.id, aws_default_subnet.default_workshop_subnet_c.id]
    assign_public_ip = true # Providing our containers with public IPs
    security_groups  = [aws_security_group.ecs_security_group.id]
  }

load_balancer {
    target_group_arn = aws_lb_target_group.green.arn
    container_name   = "springboot-app"
    container_port   = 8080
  }

  deployment_controller {
    type = "CODE_DEPLOY"
  }

#this lyfecicle rule should be added to not change the target group every time we apply (github should make it through codedeploy)

  lifecycle {
    ignore_changes = [
      load_balancer,
      task_definition
    ]
  }
}
