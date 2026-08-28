output "bucket_names" {
  description = "Created bucket names"

  value = {
    for key, bucket in digitalocean_spaces_bucket.main :
    key => bucket.name
  }
}

output "bucket_urns" {
  description = "Created bucket URNs"

  value = {
    for key, bucket in digitalocean_spaces_bucket.main :
    key => bucket.urn
  }
}

output "bucket_domains" {
  description = "Bucket domain names"

  value = {
    for key, bucket in digitalocean_spaces_bucket.main :
    key => bucket.bucket_domain_name
  }
}

output "bucket_endpoints" {
  description = "Bucket endpoints"

  value = {
    for key, bucket in digitalocean_spaces_bucket.main :
    key => bucket.endpoint
  }
}