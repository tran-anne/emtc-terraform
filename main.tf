resource "github_repository" "dev_repo" {
  name               = "dev-repo"
  description        = "development repo"
  auto_init          = true
  gitignore_template = "Terraform"
}
resource "github_repository" "backend_repo" {
  name        = "backend"
  description = "backend repo"
  auto_init   = true
}

resource "github_repository" "frontend_repo" {
  name        = "frontend"
  description = "frontend repo"
  auto_init   = true
  depends_on  = [github_repository.backend_repo]
}

resource "github_branch" "backend_development" {
  repository = github_repository.backend_repo.name
  branch     = "development"
}

resource "github_branch" "frontend_development" {
  repository = github_repository.frontend_repo.name
  branch     = "development"
}

resource "github_repository" "this" {
  name               = local.name
  description        = local.description
  auto_init          = local.auto_init
  visibility         = local.visibility
  gitignore_template = local.gitignore_template
}

resource "github_branch" "staging" {
  repository = github_repository.this.name
  branch     = local.branch_name
}