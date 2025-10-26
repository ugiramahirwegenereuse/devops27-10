terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

# Define the code you want to write into the file
locals {
  app_code = <<-EOT
    console.log("Hello, Terraform web app!");
  EOT
}

# Create a file named index.js in the nested directory webapp/src/
resource "local_file" "webapp_app" {
  content  = local.app_code
  filename = "${path.module}/webapp/src/index.js"
}

# Output the full path of the created file
output "webapp_file_path" {
  value       = resource.local_file.webapp_app.filename
  description = "The full path to the web application's index.js file."
}
