variable "project" {
  type        = string
  description = "Name of the project (frontend, infrastructure, or backend)."
  validation {
    condition     = contains(["frontend", "backend", "infrastructure"], var.project)
    error_message = "Invalid project name. Allowed values are 'frontend', 'infrastructure', or 'backend'."
  }
}

variable "env" {
  type        = string
  description = "Environment name (dev or prod)."
  validation {
    condition     = contains(["dev", "prod"], var.env)
    error_message = "Invalid environment name. Allowed values are 'dev' or 'prod'."
  }
}

variable "auto_init" {
  type        = bool
  description = "Whether to automatically initialize the repository."
  default     = true
}

variable "gitignore" {
  type        = string
  description = "Gitignore template to use (Terraform, Python, or Node)."
  validation {
    condition     = contains(["Python", "Terraform", "Node"], var.gitignore)
    error_message = "Invalid gitignore template. Allowed values are 'Terraform', 'Python', or 'Node'."
  }
}
