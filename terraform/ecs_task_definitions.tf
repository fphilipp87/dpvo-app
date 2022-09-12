resource "aws_ecs_task_definition" "workshop_app_task" {
  family        = "workshop-task-def"
  container_definitions    = jsonencode([
    {
      "name": "springboot-app",
      "image": "440175892209.dkr.ecr.eu-central-1.amazonaws.com/dpvo-springboot:348352b7bd9184377b2988787ea5afba45634763",
      "logConfiguration": {
         "logDriver": "awslogs",
         "options": {
           "awslogs-group": "/ecs/springboot",
           "awslogs-region": "eu-central-1",
           "awslogs-stream-prefix": "ecs"
        }
      },
      "portMappings": [
        {
          "containerPort": 8080,
          "hostPort": 8080,
          "protocol": "tcp"
         }
           ],
         "essential": true,
         "entryPoint": [],
         "command": []
         }
  ])

  requires_compatibilities = ["FARGATE"]
  network_mode            = "awsvpc"
  memory                  = 1024   # Specifying the memory our container requires
  cpu                     = 512    # Specifying the CPU our container requires
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
}
