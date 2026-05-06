##General

variable project_id {
  description = "The ID of the project in which the resource belongs"
  type        = string
}

variable region {
  type    = string
  default = "europe-west-1"
}

variable database_name {
  description = "The database name to apply the index"
}

variable collection {
  description = "The collection name to create index for"
  type        = string
}

variable query_scope {
  type        = string
  description = "The scope at which a query is run. Possible values are: COLLECTION, COLLECTION_GROUP"
  default     = "COLLECTION"
}

variable indexes {
  description = "The map of collection being indexed and the fields supported by this index"
  type        = map(list(map(string)))
}

variable ttl_field {
  description = "Optional. The name of the timestamp field to use for TTL (Time to Live) policy on this collection. If set, Firestore will automatically delete documents when the timestamp in this field expires."
  type        = string
  default     = null
}
