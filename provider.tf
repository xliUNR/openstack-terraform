# Configure openstack provider
provider "openstack" {
  user_name = "${var.userName}"
  tenant_name = "${var.tenantName}"
  auth_url = "${var.authURL}"
  password = "${var.adminPass}"
  region = "${var.oRegion}"
  region = "regionOne"
}
