terraform {
  required_providers {
    google      = ">= 3.50.0"
    google-beta = ">= 3.51.0"
  }
}

module "budget_builder" {
  source = "../"
  display_name = "testing budgets"
  project_id_list = ["projects/PROJECT_ID"]
  budget_amount = "100"
  threshold_percent = 1.0
  spend_basis = "CURRENT_SPEND"
  email_address = "user_email@gmail.com"
  project_id = "PROJECT_ID_for_NOTIFICATION_BUILD"
}