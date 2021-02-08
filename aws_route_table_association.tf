resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public_ecs.id
  route_table_id = aws_route_table.public.id
}