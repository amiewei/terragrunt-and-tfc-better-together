include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../terragrunt-infrastructure-module"
}

inputs = {
  prefix = "tfc-terragrunt-dev"
  instance_type  = "t3.nano"
  environment = "dev"
  
}

