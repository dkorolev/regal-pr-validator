package authz

import future.keywords.if
import future.keywords.in

default allow := false

deny if {
	not "admin" in input.user.roles
}

bad_deny if {
	"admin" != input.user.roles[_]
}

allow if not deny
