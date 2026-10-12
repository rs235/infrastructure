terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "rs235"

    workspaces {
      name = "project-workspace"
    }
  }
}
