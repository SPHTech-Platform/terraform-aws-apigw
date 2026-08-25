override_data {
  target = data.aws_caller_identity.current
  values = {
    account_id = "123456789012"
  }
}

override_data {
  target = data.aws_region.current
  values = {
    name = "ap-southeast-1"
  }
}

override_data {
  target = module.apigw_cwl_role.data.aws_caller_identity.current
  values = {
    account_id = "123456789012"
  }
}

run "verify_yaml_synthetic_with_policy" {
  command = plan
  variables {
    name                   = "synthetic-test-apigw"
    stage                  = "uat"
    body_template          = file("tests/fixtures/synthetic/synthetic_complex_api.yaml")
    enable_resource_policy = true
    resource_policy_json   = file("tests/fixtures/synthetic/synthetic_policy.json")
  }
  assert {
    condition     = can(yamldecode(output.body_spec))
    error_message = "Generated body_spec is invalid YAML syntax!"
  }
  assert {
    condition     = contains(keys(yamldecode(output.body_spec)), "x-amazon-apigateway-policy")
    error_message = "x-amazon-apigateway-policy key missing from merged output!"
  }
  assert {
    condition     = startswith(output.body_spec, "swagger:")
    error_message = "swagger: 2.0 must remain at line 1 of the YAML output — yamldecode() key sorting may have shifted it!"
  }
}

run "verify_json_synthetic_with_policy" {
  command = plan
  variables {
    name                   = "synthetic-test-apigw"
    stage                  = "uat"
    body_template          = file("tests/fixtures/synthetic/synthetic_complex_api.json")
    enable_resource_policy = true
    resource_policy_json   = file("tests/fixtures/synthetic/synthetic_policy.json")
  }
  assert {
    condition     = can(yamldecode(output.body_spec))
    error_message = "Generated body_spec is invalid JSON/YAML syntax!"
  }
}

# Layer 4: Passthrough test — body already has x-amazon-apigateway-policy embedded (current production workaround state).
# Simulates the scenario in newshub-mobile-backend-infra where the policy was hardcoded directly into the YAML template.
# enable_resource_policy = false means the module passes the body through as-is without modification.
run "verify_yaml_with_embedded_policy_passthrough" {
  command = plan
  variables {
    name                   = "synthetic-test-apigw"
    stage                  = "uat"
    body_template          = file("tests/fixtures/synthetic/synthetic_api_with_embedded_policy.yaml")
    enable_resource_policy = false
  }
  assert {
    condition     = can(yamldecode(output.body_spec))
    error_message = "Passthrough body_spec is invalid YAML syntax!"
  }
  assert {
    condition     = startswith(output.body_spec, "swagger:")
    error_message = "swagger: 2.0 must remain at line 1 in passthrough mode!"
  }
  assert {
    condition     = contains(keys(yamldecode(output.body_spec)), "x-amazon-apigateway-policy")
    error_message = "Embedded x-amazon-apigateway-policy key must be preserved in passthrough mode!"
  }
}
