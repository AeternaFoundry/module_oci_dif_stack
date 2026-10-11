resource "oci_dif_stack" "dif_stacks" {
  for_each = var.dif_stacks

  compartment_id           = each.value.compartment_id
  display_name             = each.value.display_name
  services                 = each.value.services
  stack_templates          = each.value.stack_templates
  add_service_trigger      = each.value.add_service_trigger
  defined_tags             = each.value.defined_tags
  deploy_artifacts_trigger = each.value.deploy_artifacts_trigger
  freeform_tags            = each.value.freeform_tags
  notification_email       = each.value.notification_email
  subnet_id                = each.value.subnet_id

  dynamic "adb" {
    for_each = each.value.adb != null ? each.value.adb : []
    content {
      admin_password_id            = adb.value.admin_password_id
      artifact_object_storage_path = adb.value.artifact_object_storage_path
      data_storage_size_in_tbs     = adb.value.data_storage_size_in_tbs
      dynamic "db_credentials" {
        for_each = adb.value.db_credentials != null ? adb.value.db_credentials : []
        content {
          secret_id = db_credentials.value.secret_id
          user_name = db_credentials.value.user_name
          user_type = db_credentials.value.user_type
        }
      }
      db_version                  = adb.value.db_version
      db_workload                 = adb.value.db_workload
      ecpu                        = adb.value.ecpu
      instance_id                 = adb.value.instance_id
      is_mtls_connection_required = adb.value.is_mtls_connection_required
      is_public                   = adb.value.is_public
      subnet_id                   = adb.value.subnet_id
      tools_public_access         = adb.value.tools_public_access
    }
  }

  dynamic "aidataplatform" {
    for_each = each.value.aidataplatform != null ? each.value.aidataplatform : []
    content {
      default_workspace_name = aidataplatform.value.default_workspace_name
      instance_id            = aidataplatform.value.instance_id
    }
  }

  dynamic "dataflow" {
    for_each = each.value.dataflow != null ? each.value.dataflow : []
    content {
      archive_uri = dataflow.value.archive_uri
      dynamic "connections" {
        for_each = dataflow.value.connections != null ? [dataflow.value.connections] : []
        content {
          connection_details {
            dynamic "dif_dependencies" {
              for_each = connections.value.connection_details.dif_dependencies != null ? connections.value.connection_details.dif_dependencies : []
              content {
                service_instance_id = dif_dependencies.value.service_instance_id
                service_type        = dif_dependencies.value.service_type
              }
            }
            domain_names = connections.value.connection_details.domain_names
          }
          subnet_id = connections.value.subnet_id
        }
      }
      driver_shape = dataflow.value.driver_shape
      dynamic "driver_shape_config" {
        for_each = dataflow.value.driver_shape_config != null ? [dataflow.value.driver_shape_config] : []
        content {
          memory_in_gbs = driver_shape_config.value.memory_in_gbs
          ocpus         = driver_shape_config.value.ocpus
        }
      }
      execute        = dataflow.value.execute
      executor_shape = dataflow.value.executor_shape
      dynamic "executor_shape_config" {
        for_each = dataflow.value.executor_shape_config != null ? [dataflow.value.executor_shape_config] : []
        content {
          memory_in_gbs = executor_shape_config.value.memory_in_gbs
          ocpus         = executor_shape_config.value.ocpus
        }
      }
      instance_id                  = dataflow.value.instance_id
      log_bucket_instance_id       = dataflow.value.log_bucket_instance_id
      num_executors                = dataflow.value.num_executors
      private_endpoint_id          = dataflow.value.private_endpoint_id
      spark_version                = dataflow.value.spark_version
      warehouse_bucket_instance_id = dataflow.value.warehouse_bucket_instance_id
    }
  }

  dynamic "genai" {
    for_each = each.value.genai != null ? each.value.genai : []
    content {
      base_model   = genai.value.base_model
      cluster_type = genai.value.cluster_type
      dynamic "endpoints" {
        for_each = genai.value.endpoints != null ? genai.value.endpoints : []
        content {
          endpoint_name                 = endpoints.value.endpoint_name
          is_content_moderation_enabled = endpoints.value.is_content_moderation_enabled
        }
      }
      instance_id = genai.value.instance_id
      oci_region  = genai.value.oci_region
      unit_count  = genai.value.unit_count
    }
  }

  dynamic "ggcs" {
    for_each = each.value.ggcs != null ? each.value.ggcs : []
    content {
      artifact_object_storage_path = ggcs.value.artifact_object_storage_path
      dynamic "connections" {
        for_each = ggcs.value.connections != null ? ggcs.value.connections : []
        content {
          connection_id   = connections.value.connection_id
          connection_name = connections.value.connection_name
          dynamic "dif_dependencies" {
            for_each = connections.value.dif_dependencies != null ? connections.value.dif_dependencies : []
            content {
              service_instance_id = dif_dependencies.value.service_instance_id
              service_type        = dif_dependencies.value.service_type
            }
          }
          gg_admin_secret_id = connections.value.gg_admin_secret_id
        }
      }
      instance_id        = ggcs.value.instance_id
      ocpu               = ggcs.value.ocpu
      ogg_version        = ggcs.value.ogg_version
      password_secret_id = ggcs.value.password_secret_id
      public_subnet_id   = ggcs.value.public_subnet_id
      dynamic "sources" {
        for_each = ggcs.value.sources != null ? ggcs.value.sources : []
        content {
          action                         = sources.value.action
          should_start_source_operations = sources.value.should_start_source_operations
          source_id                      = sources.value.source_id
          target_connection_name         = sources.value.target_connection_name
          target_uri                     = sources.value.target_uri
        }
      }
      subnet_id = ggcs.value.subnet_id
      dynamic "targets" {
        for_each = ggcs.value.targets != null ? ggcs.value.targets : []
        content {
          action                         = targets.value.action
          should_start_target_operations = targets.value.should_start_target_operations
          source_connection_name         = targets.value.source_connection_name
          source_uri                     = targets.value.source_uri
          target_id                      = targets.value.target_id
        }
      }
      dynamic "users" {
        for_each = ggcs.value.users != null ? ggcs.value.users : []
        content {
          action    = users.value.action
          secret_id = users.value.secret_id
          user_name = users.value.user_name
          user_type = users.value.user_type
        }
      }
    }
  }

  dynamic "objectstorage" {
    for_each = each.value.objectstorage != null ? each.value.objectstorage : []
    content {
      auto_tiering      = objectstorage.value.auto_tiering
      instance_id       = objectstorage.value.instance_id
      object_versioning = objectstorage.value.object_versioning
      storage_tier      = objectstorage.value.storage_tier
    }
  }

  dynamic "oke" {
    for_each = each.value.oke != null ? each.value.oke : []
    content {
      cluster_id = oke.value.cluster_id
      dynamic "component_value_overrides" {
        for_each = oke.value.component_value_overrides != null ? oke.value.component_value_overrides : []
        content {
          component_name  = component_value_overrides.value.component_name
          value_overrides = component_value_overrides.value.value_overrides
        }
      }
      instance_id                  = oke.value.instance_id
      manifest_object_storage_path = oke.value.manifest_object_storage_path
      namespace_name               = oke.value.namespace_name
      dynamic "secrets" {
        for_each = oke.value.secrets != null ? oke.value.secrets : []
        content {
          dynamic "secret_data" {
            for_each = secrets.value.secret_data
            content {
              key       = secret_data.value.key
              secret_id = secret_data.value.secret_id
            }
          }
          secret_name                  = secrets.value.secret_name
          template_object_storage_path = secrets.value.template_object_storage_path
        }
      }
    }
  }

  dynamic "omk" {
    for_each = each.value.omk != null ? each.value.omk : []
    content {
      cluster_id           = omk.value.cluster_id
      cluster_namespace_id = omk.value.cluster_namespace_id
      dynamic "component_value_overrides" {
        for_each = omk.value.component_value_overrides != null ? omk.value.component_value_overrides : []
        content {
          component_name  = component_value_overrides.value.component_name
          value_overrides = component_value_overrides.value.value_overrides
        }
      }
      instance_id                  = omk.value.instance_id
      manifest_object_storage_path = omk.value.manifest_object_storage_path
      namespace_name               = omk.value.namespace_name
      dynamic "secrets" {
        for_each = omk.value.secrets != null ? omk.value.secrets : []
        content {
          dynamic "secret_data" {
            for_each = secrets.value.secret_data
            content {
              key       = secret_data.value.key
              secret_id = secret_data.value.secret_id
            }
          }
          secret_name                  = secrets.value.secret_name
          template_object_storage_path = secrets.value.template_object_storage_path
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

