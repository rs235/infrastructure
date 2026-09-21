terraform {
  backend "local" {
    path = "/opt/terraform-state/aws/project/terraform.tfstate"
  }
}