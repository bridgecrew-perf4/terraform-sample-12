resource "aws_ecs_task_definition" "example" {
  family                   = "guestbook"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./container_json/guestbook.json")
  #container_definitions = file("./container_json/container_definitions.json")
  #container_definitions = file("./container_json/guestbook-redis.json")
}