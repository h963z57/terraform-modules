output "cdn_url" {
  description = "The URL of the CloudFront distribution"
  value       = aws_cloudfront_distribution.module.domain_name
}