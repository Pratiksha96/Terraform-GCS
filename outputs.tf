output "gcs_bucket_self_link" {
  value = module.gcs-management.gcs_bucket_self_link
  description = "The URI of the created resource."
}

output "gcs_bucket_url" {
  value = module.gcs-management.gcs_bucket_url
  description = "The base URL of the bucket."
}

output "gcs_bucket_name" {
  value = module.gcs-management.gcs_bucket_name
  description = "Name of the bucket created."
}

output "gcs_bucket_binding_roles" {
  value = module.gcs-management.gcs_bucket_binding_roles
  description = "Roles bindings created for the bucket."  
}

output "gcs_bucket_binding_members" {
  value = module.gcs-management.gcs_bucket_binding_members
  description = "Members bindings created for the bucket."  
}