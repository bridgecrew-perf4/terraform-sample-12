resource "aws_s3_bucket" "alb_log" {
  bucket        = "alb-log-projectecs-ty"
  force_destroy = true

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}
