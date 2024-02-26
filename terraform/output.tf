output "s3_bucket_website_url_domain" {
  value = aws_s3_bucket_website_configuration.website_config.website_domain
}

output "s3_bucket_website_url" {
  value = aws_s3_bucket_website_configuration.website_config.website_endpoint
}
