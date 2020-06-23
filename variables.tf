variable project_id {
  description = "The ID of the project in which the resource belongs"
  type        = string
}

variable region {
  type    = string
  default = "europe-west-1"
}

variable database {
  description = "The Firestore database id. Defaults to (default)"
  default     = "(default)"
}

variable query_scope {
  description = "The scope at which a query is run. Possible values are: COLLECTION, COLLECTION_GROUP"
  default     = "COLLECTION"
}


variable indexes {
  type = list(object({
    collection = string
    fields = map(string)
    }))
}