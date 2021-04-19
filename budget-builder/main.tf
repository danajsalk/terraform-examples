terraform {
  required_providers {
    google      = ">= 3.50.0"
    google-beta = ">= 3.51.0"
  }
}

provider "google" {
  impersonate_service_account = "SERVICE_ACCOUNT@ACCOUNT_ID.iam.gserviceaccount.com"
}

data "google_billing_account" "account" {
  billing_account = "BILLING_ACCOUNT_NUMBER"
}

# Creates a budget in billing account
resource "google_billing_budget" "budget" {
  billing_account = data.google_billing_account.account.id
  display_name = var.display_name
  budget_filter {
    projects = var.project_id_list
  }
  amount {
    specified_amount {
      currency_code = "USD"
      units = var.budget_amount
    }
  }
  threshold_rules {
      threshold_percent =  var.threshold_percent
      spend_basis = var.spend_basis
  }
    all_updates_rule {
    monitoring_notification_channels = [
      google_monitoring_notification_channel.notification_channel.id,
    ]
    disable_default_iam_recipients = true
  }
}

# Creates notification channel for budget alerts
resource "google_monitoring_notification_channel" "notification_channel" {
  display_name = "Budget Notification Channel"
  type         = "email"
  project = var.project_id
  labels = {
    email_address = var.email_address
  }
}