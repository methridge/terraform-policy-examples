policy "node_count" {
  query             = "data.terraform.analysis.main"
  enforcement_level = "mandatory"
  description       = "Ensure that the EC2 Name tag is applied and approved instance types are used."
}
