resource "google_firestore_field" "field" {
  for_each = {
    for key, value in var.fields :
    key => merge(
      {
        ttl          = false
        index_config = null
      },
      value != null ? value : { ttl = false, index_config = null }
    )
  }

  project    = var.project_id
  database   = var.database_name
  collection = var.collection
  field      = each.key

  dynamic "ttl_config" {
    for_each = each.value.ttl ? [1] : []
    content {}
  }

  dynamic "index_config" {
    for_each = try(each.value.index_config != null, false) ? [each.value.index_config] : []
    content {
      dynamic "indexes" {
        for_each = try(index_config.value.indexes, [])
        content {
          order        = try(indexes.value.order, null)
          array_config = try(indexes.value.array_config, null)
          query_scope  = try(indexes.value.query_scope, "COLLECTION")
        }
      }
    }
  }
}
