#  Setup input variables, don't want secrets in .tf
variable "oRegion" {
  description = "Openstack region"
  default = "regionOne"
}

variable "authURL" {
  description = "Authentication url"
}

variable "userName" {
  description = "user name for administrator account"
  default = "admin"
}

variable "tenantName" {
  description = "openstack tenant name"
  default = "admin"
}

variable "adminPass" {
  description = "password for admin credentials"
}

# Configure openstack provider
provider "openstack" {
  user_name = "${var.userName}"
  tenant_name = "${var.tenantName}"
  auth_url = "${var.authURL}"
  password = "${var.adminPass}"
  region = "${var.oRegion}"
  region = "regionOne"
}
# create a virtual router
resource "openstack_networking_router_v2" "router_1" {
  name = "router_1"
  external_network_id = ""
}

# create network
resource "openstack_networking_network_v2" "network_1" {
  name = "network_1"
  admin_state_up = "true"
}

# create test subnet
resource "openstack_networking_subnet_v2" "subnet1" {
  name = "subnet_1"
  network_id = ""
  cidr = ""
  ip_version = 4
  
}

resource "type" "name" {
  
}
