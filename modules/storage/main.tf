resource "google_storage_bucket" "bucket" {
    name = var.gcs_name
    force_destroy = var.force_destroy
    location = var.location
    storage_class = var.storage_class
    project = var.project_id
    labels = "${var.labels}"
    requester_pays = var.requester_pays
    bucket_policy_only = var.bucket_policy_only
    
    dynamic "lifecycle_rule" {
        for_each = [for rule in var.lifecycle_rules: {
            action = {
            type = rule.action.type 
            storage_class = rule.action.storage_class 
        },
        condition = {
            age = rule.condition.age 
            created_before = rule.condition.created_before 
            with_state = rule.condition.with_state 
            matches_storage_class = rule.condition.matches_storage_class 
            num_newer_versions = rule.condition.num_newer_versions 
            }
        }]
        content {
            action { 
                type = lifecycle_rule.value.action.type
                storage_class = lifecycle_rule.value.action.storage_class
            }
            condition {
                age = lifecycle_rule.value.condition.age
                created_before = lifecycle_rule.value.condition.created_before
                with_state = lifecycle_rule.value.condition.with_state
                matches_storage_class = lifecycle_rule.value.condition.matches_storage_class
                num_newer_versions = lifecycle_rule.value.condition.num_newer_versions
            }
        }
    }

    versioning {
            enabled = var.versioning_enabled
    }

    website {
        main_page_suffix = var.main_page_suffix     
        not_found_page = var.not_found_page
    }
    
    dynamic "cors" {
        for_each = [for resource in var.cors: {
        origin = resource.origin 
        method = resource.method 
        response_header = resource.response_header 
        max_age_seconds = resource.max_age_seconds
        }]
        content{
            origin = cors.value.origin
            method = cors.value.method
            response_header = cors.value.response_header
            max_age_seconds = cors.value.max_age_seconds 
        } 
    }

    retention_policy {
        is_locked = var.is_locked
        retention_period = var.retention_period
    }
    
    logging {
        log_bucket = var.log_bucket
        log_object_prefix = var.log_object_prefix
    }
    
    encryption {
        default_kms_key_name = var.default_kms_key_name
    }    
}