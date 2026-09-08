policy {

}

resource_policy "random_pet" "length_pass_policy" {
    enforcement_level = input.enforcement_level
  enforce {
    condition = attrs.length >= 3
    error_message = "random_pet length must be at least 3"
    info_message  = "length: ${attrs.length}"
  }
}

resource_policy "random_integer" "number_pass_policy" {
    enforcement_level = input.enforcement_level
    enforce {
        condition = attrs.min >= 1 && attrs.max <= 10
        error_message = "random_integer min must be at least 1 and max must be at most 10"
        info_message  = "min: ${attrs.min}, max: ${attrs.max}"
    }
}

resource_policy "random_integer" "number_fail_policy" {
    enforcement_level = input.enforcement_level
    enforce {
        condition = attrs.min < 1
        error_message = "random_integer min must be less than 1"
        info_message  = "min: ${attrs.min}, name: ${meta.name}, type: ${meta.resource_type}"
    }
}

resource_policy "random_pet" "length_fail_policy" {
    enforcement_level = input.enforcement_level
    enforce {
        condition = attrs.length < 3
        error_message = "random_pet length must be at least 3"
        info_message  = "length: ${attrs.length}, name: ${meta.name}"
    }
}

resource_policy "null_resource" "policy1" {
    enforcement_level = input.enforcement_level
    enforce {
        condition = attrs.triggers != null
        error_message = "null_resource triggers must not be null"
        info_message  = "triggers: ${attrs.triggers}"
    }
}

resource_policy "null_resource" "policy2" {
    enforcement_level = input.enforcement_level
    enforce {
        condition = attrs.triggers == null
        error_message = "null_resource triggers must not be null"
        info_message  = "triggers: ${attrs.triggers}"
    }
}

resource_policy "null_resource" "delete_operation_policy" {
    enforcement_level = input.enforcement_level
    operations = ["delete"]
    enforce {
        condition = attrs.triggers == null
        error_message = "delete operation is not allowed for null_resource"
        info_message  = "deployment group: ${meta.tfe_stack.deployment_group}, deployment name: ${meta.tfe_stack.deployment_name}, stack: ${meta.tfe_stack.stack_name}"
    }
}

resource_policy "random_pet" "delete_length_pass_policy" {
    enforcement_level = input.enforcement_level
    operations = ["delete"]
  enforce {
    condition = false
    error_message = "delete operation is not allowed for random_pet resource"
    info_message  = "deployment group: ${meta.tfe_stack.deployment_group}, deployment name: ${meta.tfe_stack.deployment_name}, stack: ${meta.tfe_stack.stack_name}"
    }
}

resource_policy "random_integer" "delete_number_pass_policy" {
    enforcement_level = input.enforcement_level
    operations = ["delete"]
    enforce {
        condition = false
        error_message = "delete operation is not allowed for random_integer resource"
        info_message  = "deployment group: ${meta.tfe_stack.deployment_group}, deployment name: ${meta.tfe_stack.deployment_name}, stack: ${meta.tfe_stack.stack_name}"
    }
}

resource_policy "null_resource" "update_operation_policy" {
    enforcement_level = input.enforcement_level
    operations = ["update"]
    enforce {
        condition = attrs.triggers == null
        error_message = "update operation is not allowed for null_resource"
        info_message  = "deployment group: ${meta.tfe_stack.deployment_group}, deployment name: ${meta.tfe_stack.deployment_name}, stack: ${meta.tfe_stack.stack_name}"
    }
}

resource_policy "random_pet" "update_length_pass_policy" {
    enforcement_level = input.enforcement_level
    operations = ["update"]
  enforce {
    condition = false
    error_message = "update operation is not allowed for random_pet resource"
    info_message  = "deployment group: ${meta.tfe_stack.deployment_group}, deployment name: ${meta.tfe_stack.deployment_name}, stack: ${meta.tfe_stack.stack_name}"
    }
}

resource_policy "random_integer" "update_number_pass_policy" {
    enforcement_level = input.enforcement_level
    operations = ["update"]
    enforce {
        condition = false
        error_message = "update operation is not allowed for random_integer resource"
        info_message  = "deployment group: ${meta.tfe_stack.deployment_group}, deployment name: ${meta.tfe_stack.deployment_name}, stack: ${meta.tfe_stack.stack_name}"
    }
}

resource_policy "null_resource" "create_operation_policy" {
    enforcement_level = input.enforcement_level
    operations = ["create"]
    enforce {
        condition = attrs.triggers == null
        error_message = "create operation is not allowed for null_resource"
        info_message  = "deployment group: ${meta.tfe_stack.deployment_group}, deployment name: ${meta.tfe_stack.deployment_name}, stack: ${meta.tfe_stack.stack_name}"
    }
}

resource_policy "random_pet" "create_length_pass_policy" {
    enforcement_level = input.enforcement_level
    operations = ["create"]
  enforce {
    condition = false
    error_message = "create operation is not allowed for random_pet resource"
    info_message  = "deployment group: ${meta.tfe_stack.deployment_group}, deployment name: ${meta.tfe_stack.deployment_name}, stack: ${meta.tfe_stack.stack_name}"
    }
}

resource_policy "random_integer" "create_number_pass_policy" {
    enforcement_level = input.enforcement_level
    operations = ["create"]
    enforce {
        condition = false
        error_message = "create operation is not allowed for random_integer resource"
        info_message  = "deployment group: ${meta.tfe_stack.deployment_group}, deployment name: ${meta.tfe_stack.deployment_name}, stack: ${meta.tfe_stack.stack_name}"
    }
}