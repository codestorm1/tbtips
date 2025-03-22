terraform {
  required_providers {
    github = {
      source  = "integrations/github"
       version = "6.6.0"
    }
  }
}
locals {
  repository_name = "tbtips"
  github_owner    = "codestorm1"
}

provider "github" {
    owner = local.github_owner
}

resource "github_repository" "tbtips" {
  name                   = local.repository_name
  description            = "TB Tips"
  visibility             = "public"
  has_issues             = true
  auto_init              = true
  gitignore_template     = "Terraform"
  delete_branch_on_merge = true
}
