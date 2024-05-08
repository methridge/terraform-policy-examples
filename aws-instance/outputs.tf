###############################################################################
# outputs.tf
#
# Module outputs in alphabetical order
###############################################################################

output "instance_ami" {
  value = aws_instance.ubuntu.ami
}

output "instance_arn" {
  value = aws_instance.ubuntu.arn
}
