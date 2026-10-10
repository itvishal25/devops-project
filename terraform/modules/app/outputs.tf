output "app_file_path" {
  description = "Path of the application file created by the module"
  value       = local_file.app.filename
}
