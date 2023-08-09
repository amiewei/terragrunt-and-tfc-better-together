include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../terragrunt-infrastructure-module"
}

inputs = {
  prefix = "tfc-terragrunt-prod"
  instance_type  = "t3.small"
  environment = "prod"
}

