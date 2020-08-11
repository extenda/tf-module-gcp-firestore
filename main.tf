resource "google_firestore_index" "fs_index" {
  provider = google-beta
  for_each = var.indexes

  collection  = each.key
  project     = var.project_id
  query_scope = var.query_scope
  database    = var.database

dynamic fields {
  for_each = distinct(flatten([ for k, v in var.indexes : [
                 for i in each.value : {
                   field_path = i.field_path
                   order      = i.order
    }]]))
    content {
      field_path = lookup(fields.value,"field_path", null)
      order      = lookup(fields.value,"order",null)
    }
 }
}
