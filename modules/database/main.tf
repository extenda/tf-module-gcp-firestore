resource "google_firestore_database" "database" {
  project                           = var.project_id
  name                              = var.database_name
  location_id                       = var.database_location_id
  type                              = var.database_type
  concurrency_mode                  = var.database_concurrency_mode
  app_engine_integration_mode       = var.database_app_engine_integration_mode
  point_in_time_recovery_enablement = var.database_point_in_time_recovery_enablement
  delete_protection_state           = var.database_delete_protection_state
  deletion_policy                   = var.terraform_deletion_policy
}

resource "google_firestore_backup_schedule" "default" {
  count = var.database_enable_backup_schedule == "true" ? 1 : 0
  project   = var.project_id
  database  = google_firestore_database.database.name
  retention = var.database_backup_retention

  dynamic "daily_recurrence" {
    for_each = var.database_backup_schedule == "daily-backup" ? [1] : []
    content {
    }						
  }

  dynamic "weekly_recurrence" {
    for_each = var.database_backup_schedule == "weekly-backup" ? [1] : []
    content {
      day = var.database_backup_weekly_recurrence
    }
  }
}
