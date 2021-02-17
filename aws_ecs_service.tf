resource "aws_ecs_service" "example" {
  name                              = "guestbook"
  cluster                           = aws_ecs_cluster.example.arn
  task_definition                   = aws_ecs_task_definition.example.arn
  desired_count                     = 2
  launch_type                       = "FARGATE"
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 60

  network_configuration {
    assign_public_ip = false
    security_groups  = [module.nginx_sg.security_group_id] #The security groups associated with the task or service.
    #security_groups  = [module.nginx_sg.security_group_id,module.redis_sg.security_group_id] #The security groups associated with the task or service.

    subnets = [
      aws_subnet.private_0.id,
      aws_subnet.private_1.id,
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.example.arn
    #container_name   = "example"
    container_name = "guestbook"
    container_port = 3000 # The port on the container to associate with the load balancer.
  }

  lifecycle {
    ignore_changes = [task_definition]
  }

  depends_on = [aws_lb.example]
}

module "nginx_sg" {
  source      = "./security_group"
  name        = "nginx-sg"
  vpc_id      = aws_vpc.project_ecs.id
  port        = 3000
  cidr_blocks = [aws_vpc.project_ecs.cidr_block]
}

module "redis_sg" {
  source      = "./security_group"
  name        = "redis-sg"
  vpc_id      = aws_vpc.project_ecs.id
  port        = 6379
  cidr_blocks = [aws_vpc.project_ecs.cidr_block]
}