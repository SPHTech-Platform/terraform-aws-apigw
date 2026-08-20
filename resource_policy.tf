# Note: Resource Policies are natively embedded directly into the OpenAPI specification
# body via x-amazon-apigateway-policy in main.tf (local.body_spec).
# This provides 100% atomic deployments, eliminates separate policy resources in state,
# and prevents post-apply policy resets forever.
