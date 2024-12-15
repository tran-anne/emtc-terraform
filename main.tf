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

resource "github_repository" "repos" {
  for_each = local.repos

  name               = each.key
  description        = each.value.description
  auto_init          = each.value.auto_init
  visibility         = each.value.visibility
  gitignore_template = each.value.gitignore_template
}

resource "github_branch" "staging_branches" {
  for_each = local.repos

  repository = github_repository.repos[each.key].name
  branch     = each.value.branch_name
}

resource "github_repository_file" "this" {
  for_each = local.files

  repository          = github_repository.this.name
  branch              = "main"
  file                = each.key
  content             = each.value.content
  commit_message      = "Managed by Terraform"
  overwrite_on_create = true
}
