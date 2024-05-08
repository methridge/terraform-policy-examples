package terraform.analysis

import rego.v1

import input as tfplan

########################
# Parameters for Policy
########################

# Consider exactly these resource types in calculations
resource_types := ["aws_instance"]

# Allowed Actions
actions := [
	"no-op",
	"create",
	"update",
]

# Mandatory Instance Tags
mandatory_tags := ["Name"]

# Allowed Types
allowed_types := [
	"t2.micro",
	"t2.small",
	"t2.medium",
]

#########
# Policy
#########

# Rule to enforce "Name" tag on all instances
tags[msg] if {
	res := tfplan.resource_changes[_]
	res.type in resource_types
	res.change.actions[_] in actions
	tags := [key | res.change.after.tags[key]]
	required_tag := mandatory_tags[_]
	required_tag in tags

	msg := sprintf("Instance %v is missing mandatory tag %v", [res.name, required_tag])
}

# Rule to restrict instance types
types[msg] if {
	res := tfplan.resource_changes[_]
	res.type in resource_types
	res.change.actions[_] in actions
	res.change.after.instance_type in allowed_types

	msg := sprintf("Instance %v is using disallowed instance type %v", [res.name, res.change.after.instance_type])
}
