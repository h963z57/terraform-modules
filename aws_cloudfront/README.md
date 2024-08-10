CLOUDFRONT module aws
===========

```tf
module "aws_cloudfront" {
  source        = "git@github.com:h963z57/terraform-modules.git//aws_cloudfront"
  env           = var.ENVIRONMENT
  comment       = "My CDN"
  bucket        = 
  bucket_arn    = 
  bucket_domain = 
  acm_crt       =  
  aliases       = ["cdn.example.com"]
  price_class   = "PriceClass_100"
}
```




