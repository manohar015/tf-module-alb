data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "manohar-b50-tf-state-bucket"
    key    = "vpc/${var.ENV}/terrafom.tfstate"
    region = "us-east-1"
  }
}