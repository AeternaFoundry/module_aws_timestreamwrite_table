output "timestreamwrite_tables_id" {
  description = "Map of id values across all timestreamwrite_tables, keyed the same as var.timestreamwrite_tables"
  value       = { for k, v in aws_timestreamwrite_table.timestreamwrite_tables : k => v.id if v.id != null && length(v.id) > 0 }
}
output "timestreamwrite_tables_arn" {
  description = "Map of arn values across all timestreamwrite_tables, keyed the same as var.timestreamwrite_tables"
  value       = { for k, v in aws_timestreamwrite_table.timestreamwrite_tables : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "timestreamwrite_tables_database_name" {
  description = "Map of database_name values across all timestreamwrite_tables, keyed the same as var.timestreamwrite_tables"
  value       = { for k, v in aws_timestreamwrite_table.timestreamwrite_tables : k => v.database_name if v.database_name != null && length(v.database_name) > 0 }
}
output "timestreamwrite_tables_magnetic_store_write_properties" {
  description = "Map of magnetic_store_write_properties values across all timestreamwrite_tables, keyed the same as var.timestreamwrite_tables"
  value       = { for k, v in aws_timestreamwrite_table.timestreamwrite_tables : k => one(v.magnetic_store_write_properties) if v.magnetic_store_write_properties != null && length(v.magnetic_store_write_properties) > 0 }
}
output "timestreamwrite_tables_region" {
  description = "Map of region values across all timestreamwrite_tables, keyed the same as var.timestreamwrite_tables"
  value       = { for k, v in aws_timestreamwrite_table.timestreamwrite_tables : k => v.region if v.region != null && length(v.region) > 0 }
}
output "timestreamwrite_tables_retention_properties" {
  description = "Map of retention_properties values across all timestreamwrite_tables, keyed the same as var.timestreamwrite_tables"
  value       = { for k, v in aws_timestreamwrite_table.timestreamwrite_tables : k => one(v.retention_properties) if v.retention_properties != null && length(v.retention_properties) > 0 }
}
output "timestreamwrite_tables_schema" {
  description = "Map of schema values across all timestreamwrite_tables, keyed the same as var.timestreamwrite_tables"
  value       = { for k, v in aws_timestreamwrite_table.timestreamwrite_tables : k => one(v.schema) if v.schema != null && length(v.schema) > 0 }
}
output "timestreamwrite_tables_table_name" {
  description = "Map of table_name values across all timestreamwrite_tables, keyed the same as var.timestreamwrite_tables"
  value       = { for k, v in aws_timestreamwrite_table.timestreamwrite_tables : k => v.table_name if v.table_name != null && length(v.table_name) > 0 }
}
output "timestreamwrite_tables_tags" {
  description = "Map of tags values across all timestreamwrite_tables, keyed the same as var.timestreamwrite_tables"
  value       = { for k, v in aws_timestreamwrite_table.timestreamwrite_tables : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "timestreamwrite_tables_tags_all" {
  description = "Map of tags_all values across all timestreamwrite_tables, keyed the same as var.timestreamwrite_tables"
  value       = { for k, v in aws_timestreamwrite_table.timestreamwrite_tables : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

