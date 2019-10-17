output "gcs_bucket_self_link" {
    value = "${google_storage_bucket.bucket.self_link}"
    description = "The URI of the created resource."
}
output "gcs_bucket_url" {
  value = "${google_storage_bucket.bucket.url}"
  description = "The base URL of the bucket."
}

output "gcs_bucket_name" {
  value = "${google_storage_bucket.bucket.name}"
  description = "The name of the bucket."
}

output "gcs_bucket_binding_roles" {
  value = "${google_storage_bucket_iam_binding.bucket_binding.*.role}"
  description = "Roles bindings created for the bucket."  
}

output "gcs_bucket_binding_members" {
  value = "${google_storage_bucket_iam_binding.bucket_binding.*.members}"
  description = "Members bindings created for the bucket."  
}
