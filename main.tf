module "web_server" {
  source        = "./http_server"
  instance_type = "t2.micro"
}