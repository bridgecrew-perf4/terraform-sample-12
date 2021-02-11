resource "aws_internet_gateway" "project_ecs" {
  vpc_id = aws_vpc.project_ecs.id
}