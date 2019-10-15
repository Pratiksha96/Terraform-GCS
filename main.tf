module "gcs-management" {
  source = "./modules/storage"
  gcs_name = "${var.gcs_name}"
  project_id = var.project_id
  force_destroy = var.force_destroy
  location = var.location
  storage_class = var.storage_class
  lifecycle_rules = var.lifecycle_rules
  # action_type = var.action_type
  # action_storage_class = var.action_storage_class
  # condition_age = var.condition_age
  # condition_created_before = var.condition_age
  # condition_with_state = var.condition_with_state
  # condition_is_live
  # condition_matches_storage_class
  # condition_num_newer_versions
  versioning_enabled = var.versioning_enabled
  main_page_suffix = var.main_page_suffix
  not_found_page = var.not_found_page
  cors = var.cors
  # cors_origin
  # cors_method
  # response_header
  # max_age_seconds
  is_locked = var.is_locked
  retention_period = var.retention_period
  labels = var.labels
  log_bucket = var.log_bucket
  log_object_prefix = var.log_object_prefix
  default_kms_key_name = var.default_kms_key_name
  requester_pays = var.requester_pays
  bucket_policy_only = var.bucket_policy_only
}