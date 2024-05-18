locals {
  src_path     = "${path.module}/lambda/${var.function_name}"

  binary_name  = var.function_name
  binary_path  = "${path.module}/tf_generated/${local.binary_name}"
  archive_path = "${path.module}/tf_generated/${var.function_name}.zip"
}

output "lambda_test_binary_path" {
  value = local.binary_path
}

output "lambda_name" {
  value = aws_lambda_function.function.function_name
}