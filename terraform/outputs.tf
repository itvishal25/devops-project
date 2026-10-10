output "file_path" {
  description = "Path of the Terraform learning file"
  value       = local_file.devops_learning.filename
}

output "current_directory" {
  description = "Current working directory returned by the data source"
  value       = data.local_command.current_directory.stdout
}

output "environment_names" {
  description = "Uppercase environment names"
  value = [
    for env in ["dev", "staging", "prod"] : upper(env)
  ]
}

output "non_production_environments" {
  description = "Non-production environments"
  value = [
    for env in ["dev", "staging", "prod"] : env
    if env != "prod"
  ]
}

output "environment_map_uppercase" {
  description = "Uppercase environment map"
  value = {
    for env, description in {
      dev  = "development"
      prod = "production"
    } : upper(env) => upper(description)
  }
}

output "production_environment" {
  description = "Only the production environment"
  value = {
    for env, description in {
      dev     = "development"
      staging = "testing"
      prod    = "production"
    } : env => description
    if env == "prod"
  }
}

output "app_file_path_from_module" {
  description = "Application file path returned by the app module"
  value       = module.app.app_file_path
}

output "prod_app_file_path_from_module" {
  description = "Production application file path returned by the app module"
  value       = module.app_prod.app_file_path
}
