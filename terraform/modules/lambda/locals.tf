locals {
  src_path     = "${path.module}/${var.function_name}"

  binary_name  = var.function_name
  binary_path  = "${path.module}/tf_generated/${local.binary_name}"
  archive_path = "${path.module}/tf_generated/${var.function_name}.zip"
}

