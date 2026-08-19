# Changelog

All notable changes to the `terraform-aws-apigw` module will be documented in this file.

## [0.6.0] - 2026-08-19

### 🚀 Major Feature & Permanent Fix
- **Native OpenAPI Spec Policy Injection ([#43](https://github.com/SPHTech-Platform/terraform-aws-apigw/pull/43)):** Embedded `x-amazon-apigateway-policy` directly into the REST API `body` payload payload in `main.tf`.
- **Atomic Deployment:** REST API routes and Resource Policies are now updated together in a single atomic AWS API Gateway call (`PutRestApi`).
- **Eliminated Deposed Objects:** Completely removed separate `aws_api_gateway_rest_api_policy` resource state, eliminating OpenTofu deposed object cleanup calls (`DeleteRestApiPolicy`) and 2-run apply requirements forever.

## [0.5.0] - 2026-08-19

### 🐛 Fixed
- Initial lifecycle trigger experiment for `aws_api_gateway_rest_api_policy`.
