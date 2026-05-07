variable "project_id" {
  description = "The ID of the project in which the resource belongs"
  type        = string
}

variable "region" {
  type    = string
  default = "europe-west-1"
}

variable "database_name" {
  description = "The database name to apply the collection"
  type        = string
}

variable "collection" {
  description = "The collection name to configure fields for"
  type        = string
}

variable "fields" {
  description = "Map of field configurations for the collection. Each field can have ttl set to true to enable TTL, and index_config for single-field indexes. Per Firestore limits, only one field can have TTL enabled per collection."
  type = map(object({
    ttl = optional(bool, false)
    index_config = optional(object({
      indexes = optional(list(object({
        order        = optional(string)
        array_config = optional(string)
        query_scope  = optional(string, "COLLECTION")
      })), [])
    }))
  }))
  default = {}
}
