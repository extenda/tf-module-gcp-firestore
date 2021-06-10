module firestore {
  source = "../"

  project_id  = "project-id"
  query_scope = "COLLECTION_GROUP"
  collection = "collection1"
  indexes = {
    index1 = [
      {
        field_path = "name"
        order = "ASCENDING"
      },
      {
        field_path = "description"
        order = "ASCENDING"
      },
    ],
    index2 = [
      {
        field_path = "name"
        order = "ASCENDING"
      },
      {
        field_path = "description"
        order = "DESCENDING"
      },
      {
        field_path = "test"
        order = "DESCENDING"
      },
  ],
 }
}
