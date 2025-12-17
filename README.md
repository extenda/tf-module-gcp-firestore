# tf-module-gcp-firestore

## Description

Cloud Firestore indexes enable simple and complex queries against documents in a database. Resources in this module manage composite indexes and not single field indexes.

## Providers

| Name | Version |
|------|---------|
| google-beta | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| database | The Firestore database id. Defaults to "(default)" | `string` | `(default)` | no |
| database_type | The type of the database. See https://cloud.google.com/datastore/docs/firestore-or-datastore for information about how to choose. Possible values are: FIRESTORE_NATIVE, DATASTORE_MODE | `string` | `FIRESTORE_NATIVE` | no
| database\_enable\_backup\_schedule | Enable database backup | `bool` | `true` | no
| database\_backup\_schedule | The backup schedule. Possible values are: daily-backup, weekly-backup | `string` | `daily-backup` | no
| database_backup_weekly_recurrence | When database_backup_schedule is weekly-backup, on which day the backup is created | `string` | `MONDAY` | no
| database_concurrency_mode | The concurrency control mode to use for this database. Possible values are: OPTIMISTIC, PESSIMISTIC, OPTIMISTIC_WITH_ENTITY_GROUPS | `string` | `OPTIMISTIC` | no
| database_delete_protection_state | State of database delete protection for this database. Possible values are DELETE_PROTECTION_STATE_UNSPECIFIED, DELETE_PROTECTION_ENABLED, DELETE_PROTECTION_DISABLED | `string` | `DELETE_PROTECTION_ENABLED` | no
| collection | The collection name to create index for | `string` | n/a | yes |
| indexes | The map of collection being indexed and the fields supported by this index | `map(list(map(string)))` | n/a | yes |
| project\_id | The ID of the project in which the resource belongs | `string` | n/a | yes |
| query\_scope | The scope at which a query is run. Possible values are: COLLECTION, COLLECTION_GROUP | `string` | `COLLECTION` | no |
