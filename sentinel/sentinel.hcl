policy "restrict-aws-instances-type-and-tag" {
  enforcement_level = "hard-mandatory"
  description       = "Ensure that the EC2 Name tag is applied and approved instance types are used."
}
