resource "aws_internet_gateway" "IGW_project_ecs" {
  vpc_id = aws_vpc.project_ecs.id
}