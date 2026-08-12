policy {

}
locals {
  approved_deployment_name = "complex"
}

resource_policy "random_pet" "complex_length_pass_policy" {
    enforcement_level = "advisory"
    filter = tfe_stack.deployment_name == local.approved_deployment_name
    enforce {
        condition = attrs.length >= 3
        error_message = "random_pet length must be at least 3"
        info_message  = "length: ${attrs.length}"
    }
}

resource_policy "random_integer" "complex_number_pass_policy" {
    enforcement_level = "advisory"
    filter = tfe_stack.deployment_name == local.approved_deployment_name
    enforce {
        condition = attrs.min >= 1 && attrs.max <= 10
        error_message = "random_integer min must be at least 1 and max must be at most 10"
        info_message  = "min: ${attrs.min}, max: ${attrs.max}"
    }
}

resource_policy "random_integer" "complex_number_fail_policy" {
    enforcement_level = "advisory"
    filter = tfe_stack.deployment_name == local.approved_deployment_name
    enforce {
        condition = attrs.min < 1
        error_message = "random_integer min must be less than 1"
        info_message  = "min: ${attrs.min}, name: ${meta.name}, type: ${meta.resource_type}"
    }
}

resource_policy "random_pet" "complex_length_fail_policy" {
    enforcement_level = "advisory"
    filter = tfe_stack.deployment_name == local.approved_deployment_name
    enforce {
        condition = attrs.length < 3
        error_message = "random_pet length must be at least 3"
        info_message  = "length: ${attrs.length}, name: ${meta.name}"
    }
}

resource_policy "null_resource" "complex_policy1" {
    enforcement_level = "advisory"
    filter = tfe_stack.deployment_name == local.approved_deployment_name
    enforce {
        condition = attrs.triggers != null
        error_message = "null_resource triggers must not be null"
        info_message  = "triggers: ${attrs.triggers}"
    }
}

resource_policy "null_resource" "complex_policy2" {
    enforcement_level = "advisory"
    filter = tfe_stack.deployment_name == local.approved_deployment_name
    enforce {
        condition = attrs.triggers == null
        error_message = "null_resource triggers must not be null"
        info_message  = "deployment group: ${meta.tfe_stack.deployment_group}, deployment name: ${meta.tfe_stack.deployment_name}, stack: ${meta.tfe_stack.stack_name}"
    }
}