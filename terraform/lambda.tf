module "lambda" {
  source = "./modules/lambda"

  function_name        = "helloworld"
  function_description = "This is a test function for terraform config"

function_tags = {
  testing = "tested"
}
}   