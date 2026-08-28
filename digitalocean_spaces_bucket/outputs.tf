output "bucket_names" {
  description = "Created bucket names"

  value = {
    for name, bucket in digitalocean_spaces_bucket.main :
    name => bucket.name
  }
}

output "bucket_urns" {
  description = "Created bucket URNs"

  value = {
    for name, bucket in digitalocean_spaces_bucket.main :
    name => bucket.urn
  }
}

output "bucket_domains" {
  description = "Bucket domain names"

  value = {
    for name, bucket in digitalocean_spaces_bucket.main :
    name => bucket.bucket_domain_name
  }
}

output "bucket_endpoints" {
  description = "Bucket endpoints"

  value = {
    for name, bucket in digitalocean_spaces_bucket.main :
    name => bucket.endpoint
  }
}