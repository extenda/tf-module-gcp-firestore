module firestore {
  source = "../"

  project_id = "project-id"
  indexes = {
    collection1 = [
      {
        field_path = "name"
        order = "ASCENDING"
      },
      {
        field_path = "description"
        order = "ASCENDING"
      },
    ],
    collection2 = [
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
