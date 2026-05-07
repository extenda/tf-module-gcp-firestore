# tf-module-gcp-firestore

## Description

This module provides Terraform resources for managing Google Cloud Firestore infrastructure. It is organized into three separate submodules for clear separation of concerns:

- **database**: Creates and manages Firestore databases, backups, and service accounts
- **collection**: Manages collection-level TTL (Time To Live) policies
- **index**: Manages composite indexes for optimized query performance

## Architecture

```
firestore/
├── database/     → google_firestore_database
├── collection/   → google_firestore_field (TTL configuration)
└── index/        → google_firestore_index (composite indexes)
```

## Providers

| Name | Version |
|------|---------|
| google | n/a |

---

## Module: `database`

### Description
Creates a Firestore database with backup schedules, service accounts, and IAM bindings.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The ID of the project | `string` | n/a | yes |
| database_name | The Firestore database id | `string` | `(default)` | no |
| database_location_id | The location of the database | `string` | `europe-west-1` | no |
| database_type | Type: FIRESTORE_NATIVE or DATASTORE_MODE | `string` | `FIRESTORE_NATIVE` | no |
| database_concurrency_mode | OPTIMISTIC, PESSIMISTIC, or OPTIMISTIC_WITH_ENTITY_GROUPS | `string` | `OPTIMISTIC` | no |
| database_enable_backup_schedule | Enable automated backups | `bool` | `true` | no |
| database_backup_schedule | daily-backup or weekly-backup | `string` | `daily-backup` | no |

---

## Module: `collection`

### Description
Manages field-level configurations for Firestore collections, including TTL (Time To Live) policies and single-field indexes. Per Firestore limits, only one TTL field is allowed per collection.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The ID of the project | `string` | n/a | yes |
| database_name | The Firestore database name | `string` | n/a | yes |
| collection | The collection name | `string` | n/a | yes |
| fields | Map of field configurations. Each field can have `ttl: true` to enable TTL, and `index_config` for single-field indexes. | `map(object({ ttl = optional(bool, false), index_config = optional(object({ indexes = optional(list(...)) })) }))` | `{}` | no |

---

## Module: `index`

### Description
Manages composite indexes for optimized query performance. Composite indexes allow efficient queries across multiple fields.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The ID of the project | `string` | n/a | yes |
| database_name | The Firestore database name | `string` | n/a | yes |
| collection | The collection name | `string` | n/a | yes |
| query_scope | COLLECTION or COLLECTION_GROUP | `string` | `COLLECTION` | no |
| indexes | Map of composite indexes. Each index is a list of field definitions. | `map(list(map(string)))` | n/a | yes |

---

## Examples

### Collection Module - fields.yaml

Example 1: Basic fields without TTL or indexes
```yaml
fields:
  name:
  email:
  status:
```

Example 2: Fields with TTL
```yaml
fields:
  expireAt:
    ttl: true
  name:
  status:
```

Example 3: Fields with single-field indexes
```yaml
fields:
  name:
    index_config:
      indexes:
        - order: ASCENDING
  email:
    index_config:
      indexes:
        - order: ASCENDING
```

Example 4: Fields with TTL and indexes combined
```yaml
fields:
  expireAt:
    ttl: true
    index_config:
      indexes:
        - order: ASCENDING
  name:
    index_config:
      indexes:
        - order: ASCENDING
  tags:
    index_config:
      indexes:
        - array_config: CONTAINS
```

### Index Module - indexes.yaml

Example 5: Composite indexes - multiple fields
```yaml
indexes:
  idx_name_status:
    - field_path: name
      order: ASCENDING
    - field_path: status
      order: DESCENDING
  idx_email_name:
    - field_path: email
      order: ASCENDING
    - field_path: name
      order: ASCENDING
```

Example 6: Composite indexes - COLLECTION_GROUP scope
```yaml
indexes:
  idx_name_status_group:
    - field_path: name
      order: ASCENDING
    - field_path: status
      order: DESCENDING
    - field_path: __name__
      order: ASCENDING
```
