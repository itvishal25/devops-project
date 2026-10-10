variable "file_content" {
  description = "Content of the Terraform learning file"
  type        = string
  default     = "Terraform is managing this file."
}

variable "is_production" {
  description = "Whether the environment is production"
  type        = bool
  default     = false
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "devops-dashboard"

  validation {
    condition     = length(var.app_name) >= 3
    error_message = "Application name must contain at least 3 characters."
  }
}

variable "replica_count" {
  description = "Number of application replicas"
  type        = number
  default     = 3

  validation {
    condition     = var.replica_count >= 1 && var.replica_count <= 5
    error_message = "Replica count must be between 1 and 5."
  }
}

variable "environments" {
  description = "Environments for the DevOps project"
  type        = list(string)
  default     = ["dev", "staging", "production"]
}

variable "environment_regions" {
  description = "Cloud region for each environment"
  type        = map(string)

  default = {
    dev        = "ap-south-1"
    staging    = "ap-south-2"
    production = "us-east-1"
  }
}

variable "app_config" {
  description = "Configuration for the DevOps application"
  type = object({
    name        = string
    environment = string
    replicas    = number
    monitoring  = bool
  })

  default = {
    name        = "devops-dashboard"
    environment = "development"
    replicas    = 2
    monitoring  = true
  }
}
