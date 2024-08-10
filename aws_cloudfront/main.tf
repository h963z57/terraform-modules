terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "~> 5.0"
    }
  }
}

resource "aws_cloudfront_origin_access_identity" "module" {
  comment = "(${var.env}) ${var.comment}"
}

resource "aws_s3_bucket_policy" "module" {
  bucket = var.bucket

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "s3:GetObject",
        Effect   = "Allow",
        Resource = "${var.bucket_arn}/*",
        Principal = {
          AWS = "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${aws_cloudfront_origin_access_identity.module.id}"
        }
      },
    ]
  })
}

resource "aws_cloudfront_distribution" "module" {
  origin {
    domain_name = var.bucket_domain
    origin_id   = "S3-${var.env}-${var.bucket}"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.module.cloudfront_access_identity_path
    }
  }

  enabled = true

  default_cache_behavior {
    target_origin_id       = "S3-${var.env}-${var.bucket}"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  viewer_certificate {
    # cloudfront_default_certificate = true
    acm_certificate_arn            = var.acm_crt
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2019"
  }

  aliases = var.aliases

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  price_class = var.price_class

}
