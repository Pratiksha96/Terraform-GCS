variable "project_id" {
  type = string
  description = "Name of project in provider configuration"
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
  description = "The bucket's Lifecycle Rules configuration. Multiple blocks of this type are permitted."
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

variable "versioning_enabled" {
  type = bool
  description = " While set to true, versioning is fully enabled for this bucket."
  default = true
}

variable "main_page_suffix" {
  type = string
  description = "Behaves as the bucket's directory index where missing objects are treated as potential directories."
  default = ""
}
variable "not_found_page" {
  type = string
  description = "The custom object to return when a requested resource is not found."
  default = ""
}

variable "cors" {
  type = list(object({
    origin = list(string)
    method = list(string)
    response_header = list(string)
    max_age_seconds = number
  }))
  description = "The bucket's Cross-Origin Resource Sharing (CORS) configuration. Multiple blocks of this type are permitted."
  default = [{
    origin = []
    method = []
    response_header = []
    max_age_seconds = 0
  }]
}

variable "is_locked" {
  type = bool
  description = "If set to true, the bucket will be locked and permanently restrict edits to the bucket's retention policy."
  default = false
}

variable "retention_period" {
  type = number
  description = "The period of time, in seconds, that objects in the bucket must be retained and cannot be deleted, overwritten, or archived."
  default = 1
}

variable "labels" {
  type = map(string)
  description = "A set of key/value label pairs to assign to the bucket."
  default = {}
}

variable "log_bucket" {
  type = string
  description = "The bucket that will receive log objects."
  default = ""
}

variable "log_object_prefix" {
  type = string
  description = "The object prefix for log objects. If it's not provided, by default GCS sets this to this bucket's name."
  default = ""
}

variable "default_kms_key_name" {
  type = string
  description = "A Cloud KMS key that will be used to encrypt objects inserted into this bucket, if no encryption method is specified."
  default = ""
}

variable "requester_pays" {
  type = bool
  description = "Enables Requester Pays on a storage bucket."
  default = false
}

variable "bucket_policy_only" {
  type = bool
  description = "Enables Bucket Policy Only access to a bucket."
  default = false
}

variable "default_acl" {
  description = "Configure this ACL to be the default ACL."
  default = "projectPrivate"
}

variable "role_entity" {
  type = "list"
  description = "List of role/entity pairs in the form ROLE:entity."
  default = []
}