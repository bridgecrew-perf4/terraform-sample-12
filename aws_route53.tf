
/*
#参照
resource "aws_route53_zone" "example" {
  name = "test.2literacy.com"
}
*/

#作成
data "aws_route53_zone" "example" {
  name = "test.2literacy.com"
}

# albへのエイリアスレコード
resource "aws_route53_record" "example" {
  zone_id = data.aws_route53_zone.example.zone_id
  name    = data.aws_route53_zone.example.name
  type    = "A"

  alias {
    name                   = aws_lb.example.dns_name
    zone_id                = aws_lb.example.zone_id
    evaluate_target_health = true
  }
}

# sslのdns検証用のレコード
resource "aws_route53_record" "example_certificate" {
  for_each = {
    for dvo in aws_acm_certificate.example.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
      #zone_id = dvo.domain_name == "test.2literacy.com" ? aws_route53_zone.example_org.zone_id : data.aws_route53_zone.example_com.zone_id
    }
  }
  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  zone_id = data.aws_route53_zone.example.id
  ttl     = 60
}


