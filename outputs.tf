output "dif_stacks_id" {
  description = "Map of id values across all dif_stacks, keyed the same as var.dif_stacks except keys with no id are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.id if v.id != null && length(v.id) > 0 }
}
output "dif_stacks_adb" {
  description = "Map of adb values across all dif_stacks, keyed the same as var.dif_stacks except keys with no adb are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.adb if v.adb != null && length(v.adb) > 0 }
  sensitive   = true
}
output "dif_stacks_add_service_trigger" {
  description = "Map of add_service_trigger values across all dif_stacks, keyed the same as var.dif_stacks except keys with no add_service_trigger are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.add_service_trigger if v.add_service_trigger != null }
}
output "dif_stacks_aidataplatform" {
  description = "Map of aidataplatform values across all dif_stacks, keyed the same as var.dif_stacks except keys with no aidataplatform are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.aidataplatform if v.aidataplatform != null && length(v.aidataplatform) > 0 }
}
output "dif_stacks_compartment_id" {
  description = "Map of compartment_id values across all dif_stacks, keyed the same as var.dif_stacks except keys with no compartment_id are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "dif_stacks_dataflow" {
  description = "Map of dataflow values across all dif_stacks, keyed the same as var.dif_stacks except keys with no dataflow are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.dataflow if v.dataflow != null && length(v.dataflow) > 0 }
}
output "dif_stacks_defined_tags" {
  description = "Map of defined_tags values across all dif_stacks, keyed the same as var.dif_stacks except keys with no defined_tags are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "dif_stacks_deploy_artifacts_trigger" {
  description = "Map of deploy_artifacts_trigger values across all dif_stacks, keyed the same as var.dif_stacks except keys with no deploy_artifacts_trigger are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.deploy_artifacts_trigger if v.deploy_artifacts_trigger != null }
}
output "dif_stacks_display_name" {
  description = "Map of display_name values across all dif_stacks, keyed the same as var.dif_stacks except keys with no display_name are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "dif_stacks_freeform_tags" {
  description = "Map of freeform_tags values across all dif_stacks, keyed the same as var.dif_stacks except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "dif_stacks_genai" {
  description = "Map of genai values across all dif_stacks, keyed the same as var.dif_stacks except keys with no genai are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.genai if v.genai != null && length(v.genai) > 0 }
}
output "dif_stacks_ggcs" {
  description = "Map of ggcs values across all dif_stacks, keyed the same as var.dif_stacks except keys with no ggcs are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.ggcs if v.ggcs != null && length(v.ggcs) > 0 }
  sensitive   = true
}
output "dif_stacks_lifecycle_details" {
  description = "Map of lifecycle_details values across all dif_stacks, keyed the same as var.dif_stacks except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "dif_stacks_notification_email" {
  description = "Map of notification_email values across all dif_stacks, keyed the same as var.dif_stacks except keys with no notification_email are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.notification_email if v.notification_email != null && length(v.notification_email) > 0 }
}
output "dif_stacks_objectstorage" {
  description = "Map of objectstorage values across all dif_stacks, keyed the same as var.dif_stacks except keys with no objectstorage are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.objectstorage if v.objectstorage != null && length(v.objectstorage) > 0 }
}
output "dif_stacks_oke" {
  description = "Map of oke values across all dif_stacks, keyed the same as var.dif_stacks except keys with no oke are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.oke if v.oke != null && length(v.oke) > 0 }
}
output "dif_stacks_omk" {
  description = "Map of omk values across all dif_stacks, keyed the same as var.dif_stacks except keys with no omk are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.omk if v.omk != null && length(v.omk) > 0 }
}
output "dif_stacks_service_details" {
  description = "Map of service_details values across all dif_stacks, keyed the same as var.dif_stacks except keys with no service_details are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.service_details if v.service_details != null && length(v.service_details) > 0 }
}
output "dif_stacks_services" {
  description = "Map of services values across all dif_stacks, keyed the same as var.dif_stacks except keys with no services are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.services if v.services != null && length(v.services) > 0 }
}
output "dif_stacks_stack_templates" {
  description = "Map of stack_templates values across all dif_stacks, keyed the same as var.dif_stacks except keys with no stack_templates are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.stack_templates if v.stack_templates != null && length(v.stack_templates) > 0 }
}
output "dif_stacks_state" {
  description = "Map of state values across all dif_stacks, keyed the same as var.dif_stacks except keys with no state are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.state if v.state != null && length(v.state) > 0 }
}
output "dif_stacks_subnet_id" {
  description = "Map of subnet_id values across all dif_stacks, keyed the same as var.dif_stacks except keys with no subnet_id are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.subnet_id if v.subnet_id != null && length(v.subnet_id) > 0 }
}
output "dif_stacks_system_tags" {
  description = "Map of system_tags values across all dif_stacks, keyed the same as var.dif_stacks except keys with no system_tags are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "dif_stacks_time_created" {
  description = "Map of time_created values across all dif_stacks, keyed the same as var.dif_stacks except keys with no time_created are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "dif_stacks_time_updated" {
  description = "Map of time_updated values across all dif_stacks, keyed the same as var.dif_stacks except keys with no time_updated are omitted"
  value       = { for k, v in oci_dif_stack.dif_stacks : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}

