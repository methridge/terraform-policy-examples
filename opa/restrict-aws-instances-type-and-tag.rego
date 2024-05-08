package terraform.analysis

# import rego.v1

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
# Functions
#########

array_contains(arr, elem) {
	arr[_] = elem
}

#########
# Policy
#########

# Rule to enforce "Name" tag on all instances
tags[msg] {
	res := tfplan.resource_changes[_]
	array_contains(resource_types, res.type)
	array_contains(actions, res.change.actions[_])
	tags := [key | res.change.after.tags[key]]
	required_tag := mandatory_tags[_]
	not array_contains(tags, required_tag)

	msg := sprintf("Instance %v is missing mandatory tag %v", [res.name, required_tag])
}

# Rule to restrict instance types
types[msg] {
	res := tfplan.resource_changes[_]
	array_contains(resource_types, res.type)
	array_contains(actions, res.change.actions[_])
	not array_contains(allowed_types, res.change.after.instance_type)

	msg := sprintf("Instance %v is using disallowed instance type %v", [res.name, res.change.after.instance_type])
}
