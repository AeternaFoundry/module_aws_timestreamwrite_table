variable "timestreamwrite_tables" {
  description = <<EOT
Map of timestreamwrite_tables, attributes below
Required:
    - database_name
    - table_name
Optional:
    - region
    - tags
    - tags_all
    - magnetic_store_write_properties (block):
        - enable_magnetic_store_writes (optional)
        - magnetic_store_rejected_data_location (optional, block):
            - s3_configuration (optional, block):
                - bucket_name (optional)
                - encryption_option (optional)
                - kms_key_id (optional)
                - object_key_prefix (optional)
    - retention_properties (block):
        - magnetic_store_retention_period_in_days (required)
        - memory_store_retention_period_in_hours (required)
    - schema (block):
        - composite_partition_key (optional, block):
            - enforcement_in_record (optional)
            - name (optional)
            - type (required)
EOT

  type = map(object({
    database_name = string
    table_name    = string
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
    magnetic_store_write_properties = optional(object({
      enable_magnetic_store_writes = optional(bool)
      magnetic_store_rejected_data_location = optional(object({
        s3_configuration = optional(object({
          bucket_name       = optional(string)
          encryption_option = optional(string)
          kms_key_id        = optional(string)
          object_key_prefix = optional(string)
        }))
      }))
    }))
    retention_properties = optional(object({
      magnetic_store_retention_period_in_days = number
      memory_store_retention_period_in_hours  = number
    }))
    schema = optional(object({
      composite_partition_key = optional(object({
        enforcement_in_record = optional(string)
        name                  = optional(string)
        type                  = string
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.timestreamwrite_tables : (
        v.retention_properties == null || (v.retention_properties.magnetic_store_retention_period_in_days >= 1 && v.retention_properties.magnetic_store_retention_period_in_days <= 73000)
      )
    ])
    error_message = "must be between 1 and 73000"
  }
  validation {
    condition = alltrue([
      for k, v in var.timestreamwrite_tables : (
        v.retention_properties == null || (v.retention_properties.memory_store_retention_period_in_hours >= 1 && v.retention_properties.memory_store_retention_period_in_hours <= 8766)
      )
    ])
    error_message = "must be between 1 and 8766"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

