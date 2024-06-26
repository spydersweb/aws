resource "null_resource" "function_binary" {
  provisioner "local-exec" {
    command = "GOOS=linux GOARCH=amd64 CGO_ENABLED=0 GOFLAGS=-trimpath go build -mod=readonly -ldflags='-s -w' -o ${path.module}/tf_generated/bootstrap ${local.src_path}"
  }
}

data "archive_file" "function_archive" {
  depends_on = [null_resource.function_binary]

  type        = "zip"
  source_file = "${local.binary_path}/${local.binary_name}"
  output_path = local.archive_path
}

resource "aws_lambda_function" "function" {
  function_name = var.function_name
  description   = var.function_description
  role          = aws_iam_role.lambda.arn
  handler       = var.handler
  memory_size   = var.memory_size

  filename         = local.archive_path
  source_code_hash = data.archive_file.function_archive.output_base64sha256

  runtime = var.runtime

  tags = var.function_tags
}

resource "aws_cloudwatch_log_group" "log_group" {
  name              = "/aws/lambda/${aws_lambda_function.function.function_name}"
  retention_in_days = 7
}