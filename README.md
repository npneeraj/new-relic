# New Relic APM Alert Policy with Terraform

This repository contains a Terraform configuration to create and manage New Relic alert policies with pre-configured monitoring conditions for APM applications. It provisions an alert policy with two NRQL-based alert conditions: one for Apdex (application performance) tracking and another for error rate monitoring.

## What this repo does

- **Creates a New Relic Alert Policy** with configurable incident preference and notification channels
- **Deploys two alert conditions**:
  - **Apdex Condition**: Monitors application performance satisfaction (warning and critical thresholds)
  - **Error Rate Condition**: Tracks transaction errors as a percentage (warning and critical thresholds)
- **Supports multiple conditions**: Dynamic condition creation using Terraform `count` for scalable policy management
- **Environment-specific configuration**: Uses Terraform variables and `.tfvars` file for easy customization across environments

## Quick start

1. **Prerequisites**
   - [Terraform](https://www.terraform.io/downloads) installed
   - New Relic account with API key (format: `NRAK-...`)
   - Account ID from your New Relic organization

2. **Update configuration**
   - Edit `terraform.tfvars` with your New Relic credentials and application settings:
     ```hcl
     account_id = "YOUR_ACCOUNT_ID"
     application_name = "YOUR_APP_NAME"
     var-name = ["CONDITION_1", "CONDITION_2"]  # Condition names
     apdex_warning_threshold = 0.8
     apdex_critical_threshold = 0.7
     error_rate_warning_threshold = 2
     error_rate_critical_threshold = 5
     ```

3. **Deploy**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

4. **View outputs**
   ```bash
   terraform output policy_id  # Returns the provisioned alert policy ID
   ```

## Configuration reference

| File | Purpose |
|------|---------|
| `main.tf` | Alert policy and condition resources |
| `variable.tf` | Input variables for policy and condition configuration |
| `output.tf` | Output values (policy ID) |
| `provider.tf` | New Relic Terraform provider setup |
| `terraform.tfvars` | Environment-specific variable values |

### Key variables

- `application_name`: The New Relic APM application to monitor
- `account_id`: Your New Relic account ID
- `policy_name`: Custom alert policy name (defaults to `"{application_name}: APM Monitoring"`)
- `channel_ids`: Notification channel IDs (optional, for sending alerts to Slack, PagerDuty, etc.)
- `apdex_*`: Apdex condition thresholds and duration (seconds)
- `error_rate_*`: Error rate condition thresholds and duration (seconds)
- `runbook_url`: URL to incident runbook documentation

## Try asking

- How do I add more alert conditions beyond Apdex and error rate?
- How do I link notification channels (Slack, PagerDuty) to this alert policy?
- What's the difference between `PER_POLICY`, `PER_CONDITION`, and `PER_CONDITION_AND_TARGET` incident preferences?
