data "aws_region" "current" {}

data "aws_ami" "eks" {
  include_deprecated = true
  owners = [
    "accountnumber"
  ]
  filter {
    name = "name"
    values = [local.ami_name]
  }
}