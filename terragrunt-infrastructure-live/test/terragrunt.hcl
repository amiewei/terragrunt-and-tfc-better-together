include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../terragrunt-infrastructure-module"
}

inputs = {
  prefix = "tfc-terragrunt-test"
  instance_type  = "t3.micro"
  environment = "test"
}

