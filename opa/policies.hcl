policy "tags" {
  query             = "data.terraform.analysis.tags"
  enforcement_level = "mandatory"
  description       = "Ensure that the EC2 Name tag is applied."
}

policy "types" {
  query             = "data.terraform.analysis.tags"
  enforcement_level = "mandatory"
  description       = "Ensure that the EC2 is using an approved instance type."
}
