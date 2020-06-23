# locals {
#   collection_fields = flatten([for collection_key, collection_name in var.indexes : [
#     for field_key, field in collection_name.fields : {
#       collection = collection_name.collection
#       field      = field
#     }
#     ]
#   ])
# }

#   for_each = {
#     for collection_name in local.collection_fields :
#     "${collection_name.collection}.${collection_name.field}" => collection_name
#   }

# resource "google_firestore_index" "fs_index" {
#   provider = google-beta

#   collection = var.collection
#   project    = var.project_id

#   dynamic fields {
#     for_each = var.fields

#     content {
#       field_path = fields.value.field_path
#       order      = fields.value.order
#   }
#  }
# }


# indexes:
#   - collection: coll1
#     fields:
#     - field_path: name
#     - field_path: desc
#       order: ASCENDING

#   - collection: coll2
#     fields:
#     - field_path: priority
#       order: DESCENDING
#     - field_path: created
#       order: ASCENDING

resource "google_firestore_index" "fs_index" {
  provider = google-beta

  for_each = {
    for coll in var.indexes :
    coll.collection => coll
  }
  collection = each.key
  project    = var.project_id


  dynamic fields {
    for_each = each.value.fields

    content {
      field_path = each.value.fields.field_path
      order      = each.value.fields.order
  }
 }
}