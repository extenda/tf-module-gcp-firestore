##General

variable project_id {
  description = "The ID of the project in which the resource belongs"
  type        = string
}

variable region {
  type    = string
  default = "europe-west-1"
}

##Databases

variable database_location_id {
  description = "The location of the database. Available locations are listed at https://cloud.google.com/firestore/docs/locations."
  default = "europe-west-1"
}

variable database_name {
  description = "The Firestore database id. Defaults to (default)"
  default     = "(default)"
}

variable database_type {
  description = "The type of the database. See https://cloud.google.com/datastore/docs/firestore-or-datastore for information about how to choose. Possible values are: FIRESTORE_NATIVE, DATASTORE_MODE."
  default = "FIRESTORE_NATIVE"
}

variable database_concurrency_mode {
  description = "The concurrency control mode to use for this database. Possible values are: OPTIMISTIC, PESSIMISTIC, OPTIMISTIC_WITH_ENTITY_GROUPS"
  default = "OPTIMISTIC"
}

variable database_app_engine_integration_mode {
  description = "(Optional) The App Engine integration mode to use for this database. Possible values are: ENABLED, DISABLED."
  default = "DISABLED"
}

variable database_point_in_time_recovery_enablement {
  description = "Whether to enable the PITR feature on this database. Possible values are: POINT_IN_TIME_RECOVERY_ENABLED, POINT_IN_TIME_RECOVERY_DISABLED."
  default = "POINT_IN_TIME_RECOVERY_DISABLED"
}

variable database_delete_protection_state {
  description = "State of database delete protection for this database. Possible values are DELETE_PROTECTION_STATE_UNSPECIFIED, DELETE_PROTECTION_ENABLED, DELETE_PROTECTION_DISABLED"
  default = "DELETE_PROTECTION_ENABLED"
}

variable terraform_deletion_policy {
  description = "Deletion behavior for this database. If the deletion policy is ABANDON, the database will be removed from Terraform state but not deleted from Google Cloud upon destruction. If the deletion policy is DELETE, the database will both be removed from Terraform state and deleted from Google Cloud upon destruction."
  default = "ABANDON"
}

variable database_backup_retention {
  description = "At what relative time in the future, compared to its creation time, the backup should be deleted, e.g. keep backups for 7 days. A duration in seconds with up to nine fractional digits, ending with 's'. Defaults to 3 days. You can set this to a value up to 14 weeks."
  default = "259200s"
}

# ##Indexes

# variable index_collection {
#   description = "The collection name to create index for"
#   type        = string
# }

# variable index_query_scope {
#   type        = string
#   description = "The scope at which a query is run. Possible values are: COLLECTION, COLLECTION_GROUP"
#   default     = "COLLECTION"
# }

# variable indexes {
#   description = "The map of collection being indexed and the fields supported by this index"
#   type        = map(list(map(string)))
# }
