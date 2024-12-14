#1. In main.tf, create or use an existing repository with the details of your choice in Terraform.

#2. In datasources.tf create a data source to retrieve the currently authenticated user.

#3. In outputs.tf create an output in the following format replaced with your own information inline. Do not use an external template:

output "output" {
  value = <<EOT
  Login: ${data.github_user.current-user.login}
  URL:
    HTTP: ${github_repository.dev_repo.http_clone_url}
    SSH: ${github_repository.dev_repo.ssh_clone_url}
  EOT
}


#4. Ensure the formatting is exactly as above with each piece of information on its own line with the HTTP and SSH items indented.
#5. Apply and output the information.