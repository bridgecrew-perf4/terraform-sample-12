resource "aws_instance" "default" {
  ami                    = "ami-0992fc94ca0f1415a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.module_sg.security_group_id]
  subnet_id              = aws_subnet.public_ecs.id

  user_data = file("./user_data.sh")
}

module "module_sg" {
  source      = "./security_group"
  name        = "module-sg"
  vpc_id      = aws_vpc.project_ecs.id
  port        = 80
  cidr_blocks = ["0.0.0.0/0"]
}