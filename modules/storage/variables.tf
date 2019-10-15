variable "key_file_path" {
  type = string
  description = "Path to credentials"
  default = ""
}

variable "project_id" {
  type = string
  description = "Name of project in provider configuration"
  default = ""
}

variable "zone" {
  type = string
  description = "Provider zone"
  default = ""
}

variable "region" {
  type = string
  description = "Provider region"
  default = ""
}


variable "gcs_name" {
  type = string
  description = "The name of the bucket."
  default = ""
}

variable "force_destroy" {
  type = bool
  description = "When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run."
  default = false
}

variable "location" {
  type = string
  description = "The GCS Location"
  default = "US"
}

# variable "gcs_project_id" {
#   type = string
#   description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
#   default = ""
# }

variable "storage_class" {
  type = string
  description = "The Storage Class of the new bucket. Supported values include: STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE."
  default = "STANDARD"
}

variable "lifecycle_rules" {
  type = list(object({
    action = object({
      type = string
      storage_class = string
    }),
    condition = object({
      age = number
      created_before = string
      with_state = string
      matches_storage_class = list(string)
      num_newer_versions = number
    })    
  }))
  default = [{
    action = {
      type = ""
      storage_class = ""
    },
    condition = {
      age = 0
      created_before = ""
      with_state = ""
      is_live = false
      matches_storage_class = []
      num_newer_versions = 0
    }
  }]
}

# variable "action_type" {
#   type = string
#   description = " The type of the action of this Lifecycle Rule. Supported values include: Delete and SetStorageClass."
#   default = ""
# }

# variable "action_storage_class" {
#   type = string
#   description = "The target Storage Class of objects affected by this Lifecycle Rule. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE."
#   default = ""
# }

# variable "condition_age" {
#     type = number
#     description = "Minimum age of an object in days to satisfy this condition."
#     default = 0  
# }

# variable "condition_created_before" {
#   type = string
#   description = "Creation date of an object in RFC 3339 (e.g. 2017-06-13) to satisfy this condition."
#   default = ""
# }

# variable "condition_with_state" {
#   type = string
#   description = "Match to live and/or archived objects. Unversioned buckets have only live objects. Supported values include: LIVE, ARCHIVED, ANY."
#   default = ""
# }

# variable "condition_is_live" {
#   type = bool
#   description = "Defaults to false to match archived objects. If true, this condition matches live objects. Unversioned buckets have only live objects."
#   default = false
# }

# variable "condition_matches_storage_class" {
#   type = string
#   description = "Storage Class of objects to satisfy this condition."
#   default = ""
# }

# variable "condition_num_newer_versions" {
#   type = number
#   description = "Relevant only for versioned objects. The number of newer versions of an object to satisfy this condition."
#   default = 0
# }

variable "versioning_enabled" {
  type = bool
  description = " While set to true, versioning is fully enabled for this bucket."
  default = true
}

variable "main_page_suffix" {
  type = string
  description = ""
  default = ""
}
variable "not_found_page" {
  type = string
  description = ""
  default = ""
}

variable "cors" {
  type = list(object({
    origin = list(string)
    method = list(string)
    response_header = list(string)
    max_age_seconds = number
  }))
  default = [{
    origin = []
    method = []
    response_header = []
    max_age_seconds = 0
  }]
}


# variable "cors_origin" {
#   type = list(string)
#   description = "The bucket's Cross-Origin Resource Sharing (CORS) configuration. Multiple blocks of this type are permitted. Structure is documented below."
#   default = []
# }

# variable "cors_method" {
#   type = string
#   description = ""
#   default = ""
# }

# variable "response_header" {
#   type = string
#   description = ""
#   default = ""
# }

# variable "max_age_seconds" {
#   type = number
#   description = ""
#   default = 0
# }

variable "is_locked" {
  type = bool
  description = ""
  default = false
}

variable "retention_period" {
  type = number
  description = ""
  default = 1
}

variable "labels" {
  type = map(string)
  description = ""
  default = {}
}

variable "log_bucket" {
  type = string
  description = ""
  default = ""
}

variable "log_object_prefix" {
  type = string
  description = ""
  default = ""
}

variable "default_kms_key_name" {
  type = string
  description = ""
  default = ""
}

variable "requester_pays" {
  type = bool
  description = ""
  default = false
}

variable "bucket_policy_only" {
  type = bool
  description = ""
  default = false
}