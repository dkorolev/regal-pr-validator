package authz

import future.keywords.if
import future.keywords.in

default allow := false

deny if {
	not "admin" in input.user.roles
}

allow if not deny
