# Variables for provider config
variable "oRegion" {
  description = "Openstack region"
  default     = "RegionOne"
}

variable "authURL" {
  description = "Authentication URL"
}

variable "userName" {
  description = "user name for administrator account"
  default     = "admin"
}

variable "tenantName" {
  description = "openstack tenant name"
  default     = "admin"
}

variable "adminPass" {
  description = "password for admin credentials"
}


# Configure openstack provider with variables from a .tfvars file. 
# This is so that we do not upload secrets onto Github.
provider "openstack" {
  user_name = "${var.userName}"
  tenant_name = "${var.tenantName}"
  auth_url = "${var.authURL}"
  password = "${var.adminPass}"
  region = "${var.oRegion}"
}
