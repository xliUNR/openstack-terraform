# Variables for provider config
variable "oRegion" {
  description = "Openstack region"
  default     = "RegionOne"
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
