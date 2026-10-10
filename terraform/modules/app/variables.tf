variable "app_message" {
  description = "Message written by the application module"
  type        = string
  default     = "Application created by reusable Terraform module."
}

variable "app_name" {
  description = "Name of the application file"
  type        = string
}
