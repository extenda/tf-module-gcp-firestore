resource "google_firestore_index" "fs_index" {
  for_each = var.indexes

  collection  = var.collection
  project     = var.project_id
  query_scope = var.query_scope
  database    = var.database_name

dynamic fields {
  for_each = distinct(flatten([ for k, v in var.indexes : [
                 for i in each.value : {
                   field_path   = i.field_path
                   order        = i.order
                   array_config = i.array_config
    }]]))
    content {
      field_path   = lookup(fields.value,"field_path", null)
      order        = lookup(fields.value,"order",null)
      array_config = lookup(fields.value,"array_config",null)
    }
  }
}
