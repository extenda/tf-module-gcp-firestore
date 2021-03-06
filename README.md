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
| collection | The collection name to create index for | `string` | n/a | yes |
| indexes | The map of collection being indexed and the fields supported by this index | `map(list(map(string)))` | n/a | yes |
| project\_id | The ID of the project in which the resource belongs | `string` | n/a | yes |
| query\_scope | The scope at which a query is run. Possible values are: COLLECTION, COLLECTION_GROUP | `string` | `COLLECTION` | no |
