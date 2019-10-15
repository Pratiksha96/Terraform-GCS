project_id = "gcp-trial-254611"
region = ""
zone = ""
key_file_path = "key.json"
gcs_name = "firstBucket15102019"
//force_destroy = ""
location = ""
storage_class = ""
lifecycle_rules = [{
    action = {
        type = ""
        storage_class = ""
    },
    condition = {
        age = 99999
        created_before = ""
        with_state = ""
        matches_storage_class = ["STANDARD"]
        num_newer_versions = 9999
    }
}]
versioning_enabled = false
main_page_suffix = ""
not_found_page = ""
cors = [{
    origin = []
    method = []
    response_header = []
    max_age_seconds = 9999
}]
//is_locked = false
//retention_period = ""
labels = {}
log_bucket = ""
log_object_prefix = ""
default_kms_key_name = ""
//requester_pays = ""
//bucket_policy_only = ""