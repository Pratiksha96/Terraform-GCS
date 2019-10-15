output "gcs_bucket_self_link" {
    value = "${google_storage_bucket.bucket.self_link}"
    description = "The URI of the created resource."
}
output "gcs_bucket_url" {
  value = "${google_storage_bucket.bucket.url}"
  description = "The base URL of the bucket."
}
