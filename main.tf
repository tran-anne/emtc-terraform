resource "github_repository" "dev-repo" {
  name               = "dev-repo"
  description        = "development repo"
  auto_init          = true
  gitignore_template = "terraform"
}