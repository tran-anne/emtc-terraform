locals {
  name               = "${var.project}-${var.env}"
  description        = "${var.project} ${var.env} repository"
  auto_init          = true
  visibility         = var.env == "dev" ? "private" : "public"
  gitignore_template = "Terraform"
  branch_name        = "staging"
}

locals {
  repos = {
    "infra-dev" = {
      description        = "Infrastructure Dev Repository"
      auto_init          = true
      visibility         = "private"
      gitignore_template = "Terraform"
      branch_name        = "staging"
    }
    "infra-prod" = {
      description        = "Infrastructure Prod Repository"
      auto_init          = true
      visibility         = "public"
      gitignore_template = "Terraform"
      branch_name        = "staging"
    }
  }
}

locals {
  files = {
    "gitignore" = file("templates/gitignore.tpl")
    "README.md" = templatefile("templates/README.md.tpl", {
      repo_name        = github_repository.this.name
      repo_description = github_repository.this.description
      html_url         = github_repository.this.html_url
    })
  }
}

