resource "local_file" "app" {
  filename = "${path.module}/${var.app_name}.txt"
  content  = var.app_message
}
