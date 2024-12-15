locals {
  name               = "${var.project}-${var.env}"
  description        = "${var.project} ${var.env} repository"
  auto_init          = true
  visibility         = var.env == "dev" ? "private" : "public"
  gitignore_template = "Terraform"
  branch_name        = "staging"
}
