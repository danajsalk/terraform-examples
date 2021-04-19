#########
# Budget Variables
#########
variable "display_name" {
  type        = string
  description = "Name of budget"
}
variable "project_id_list" {
  type        = list(string)
  description = "list of projects in budget"
}
variable "budget_amount" {
  type        = string
  description = "Total for monthly budget"
}
variable "threshold_percent" {
  type        = number
  description = "percent of budget alerting"
}
variable "spend_basis" {
  type        = string
  description = "FORECASTED or CURRENT_SPEND"
}
variable "email_address" {
  type        = string
  description = "email address for budget notifications"
}
variable "project_id" {
  type        = string
  description = "project for notification channels"
}