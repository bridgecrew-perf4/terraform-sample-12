resource "aws_route_table" "private_0" {
  vpc_id = aws_vpc.project_ecs.id
}

resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.project_ecs.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.project_ecs.id
}

/*
resource "aws_route_table" "public_1" {
  vpc_id = aws_vpc.project_ecs.id
}
*/
