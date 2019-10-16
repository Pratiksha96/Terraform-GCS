project_id = "gcp-trial-254611"
region = ""
zone = ""
key_file_path = "key.json"
gcs_name = "2019-10-16-second-bucket"
force_destroy = false
location = "us"
//storage_class = ""
lifecycle_rules = [{
    action = {
        type = "Delete"
        storage_class = ""
    },
    condition = {
        created_before = ""
        age = 5
        with_state = ""
        matches_storage_class = ["STANDARD"]
        num_newer_versions = 1
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
is_locked = false
retention_period = 1
//labels = {}
log_bucket = ""
log_object_prefix = ""
default_kms_key_name = ""
requester_pays = false
bucket_policy_only = false
role_entity = [
    # "OWNER:demo-service-account-1@gcp-trial-254611.iam.gserviceaccount.com",
    "WRITER:jainpratiksha2110@gmail.com"
]