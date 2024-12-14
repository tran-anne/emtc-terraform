#1. In a datasources.tf file, use data sources to retrieve all information.

#2. Retrieve the username of the currently authenticated GitHub user.

data "github_user" "current-user" {
  username = ""
}

#3. Retrieve all information about the current GitHub repository.

data "github_repository" "current-repo" {
  name = "emtc-terraform"
}

#4. Retrieve all information about the default branch.

data "github_branch" "default" {
  repository = data.github_repository.current-repo.name
  branch     = data.github_repository.current-repo.default_branch
}

#5. Retrieve the directory tree.

data "github_tree" "tree" {
  recursive  = true
  repository = data.github_repository.current-repo.name
  tree_sha   = data.github_branch.default.sha
}

#6. Only hardcode the repository name ONCE. use references for all other required attributes.

