terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

moved {
  from = local_file.function_demo_renamed
  to   = local_file.function_demo_final
}

provider "local" {}

resource "local_file" "devops_learning" {
  filename = "${path.module}/${local.project_name}-${local.environment}.txt"
  content  = var.file_content
}

resource "local_file" "deployment_info" {
  filename = "${path.module}/deployment-info.txt"
  content  = "Application file: ${local_file.devops_learning.filename}"

  depends_on = [
    local_file.devops_learning
  ]
}

resource "local_file" "count_example" {
  count    = 3
  filename = "${path.module}/count-example-${count.index}.txt"
  content  = "This is count instance ${count.index}"
}

resource "local_file" "for_each_example" {
  for_each = toset(["dev", "staging", "prod"])

  filename = "${path.module}/${each.key}.txt"
  content  = "Environment: ${each.key}"
}

resource "local_file" "map_example" {
  for_each = {
    dev     = "development"
    staging = "testing"
    prod    = "production"
  }

  filename = "${path.module}/${each.key}-environment.txt"
  content  = "Environment: ${each.value}"
}

resource "local_file" "conditional_example" {
  filename = "${path.module}/environment.txt"

  content = var.is_production ? "Environment: production" : "Environment: development"
  lifecycle {
    prevent_destroy = true
  }
}

module "app" {
  source      = "./modules/app"
  app_message = "DevOps application managed by Terraform module."
  app_name    = "devops-app"
}

module "app_prod" {
  source      = "./modules/app"
  app_message = "Production application managed by Terraform module."
  app_name    = "prod-app"
}

resource "local_file" "imported_app" {
  filename = "${path.module}/imported-app.txt"
  content  = "Imported resource"
  lifecycle {
    prevent_destroy       = true
    create_before_destroy = true
  }
}

resource "local_file" "ignore_changes_demo" {
  filename = "${path.module}/ignore-changes-demo.txt"
  content  = "Managed by Terraform"
}

resource "local_file" "function_demo_final" {
  filename = "${path.module}/function-demo.txt"
  content  = upper("hello from terraform")
}

resource "local_file" "functions_combined" {
  filename = "${path.module}/functions-combined.txt"

  content = join(", ", [
    upper("dev"),
    lower("PRODUCTION"),
    "Environment count: ${length(["dev", "staging", "prod"])}"
  ])
}

resource "local_file" "replace_demo" {
  filename = "${path.module}/replace-demo.txt"
  content  = replace("dev-app-server", "dev", "prod")
}

resource "local_file" "split_demo" {
  filename = "${path.module}/split-demo.txt"
  content  = join("\n", split(",", "dev,staging,prod"))
}

resource "local_file" "lookup_demo" {
  filename = "${path.module}/lookup-demo.txt"

  content = lookup({
    dev     = "development"
    staging = "testing"
    prod    = "production"
  }, "staging", "unknown")
}

resource "local_file" "object_demo" {
  filename = "${path.module}/object-demo.txt"
  content  = "Application: ${var.app_config.name}\nEnvironment: ${var.app_config.environment}\nReplicas: ${var.app_config.replicas}\nMonitoring: ${var.app_config.monitoring}"
}
