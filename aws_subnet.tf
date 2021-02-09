resource "aws_subnet" "public_ecs" {
  vpc_id                  = aws_vpc.project_ecs.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1a"
}