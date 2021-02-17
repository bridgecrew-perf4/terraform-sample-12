terraform {
  backend "s3" {
    bucket = "tfstate-permanently-ty"
    key    = "guestbook/terraform.tfstate"
    region = "ap-northeast-1"
  }
}