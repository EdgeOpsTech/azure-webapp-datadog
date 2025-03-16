# Azure Web App + Datadog Integration with Terraform & GitHub Actions

This repository deploys an Azure Web App with a Datadog monitor using Terraform, fully automated via GitHub Actions.

## Prerequisites

1. **Azure Subscription**: You need an Azure account.
2. **Datadog Account**: Obtain a Datadog API key and App Key.
3. **GitHub Secrets**: Add these secrets to your repo (Settings → Secrets → Actions):
   - `ARM_CLIENT_ID`
   - `ARM_CLIENT_SECRET`
   - `ARM_SUBSCRIPTION_ID`
   - `ARM_TENANT_ID`
   - `DATADOG_API_KEY`
   - `DATADOG_APP_KEY`
4. **Terraform CLI** (optional, if you want to run locally).

## Usage

1. **Clone or Fork** this repo.
2. **Customize** variables in `terraform/variables.tf` if needed.
3. **Push or Open a Pull Request** to trigger GitHub Actions:
   - **Pull Request** to `main` → runs `terraform plan`.
   - **Push to `main`** → runs `terraform plan` then `terraform apply`.
4. **View the Infrastructure** in Azure Portal & monitor with Datadog.

## License

MIT (or your preferred license).
