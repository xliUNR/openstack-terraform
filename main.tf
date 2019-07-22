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

variable "extGateway" {
  description = "external gateway IP"
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

#create an external network
resource "openstack_networking_network_v2" "extNet" {
  name = "extNet"
  external = "true"
}


# create internal network
resource "openstack_networking_network_v2" "internalNet_1" {
  name = "internalNet_1"
  admin_state_up = "true"
}

# create test subnet
resource "openstack_networking_subnet_v2" "subnet1" {
  name = "subnet_1"
  network_id = "${openstack_networking_network_v2.internalNet_1.id}"
  cidr = ""
  ip_version = 4
  
}

# create a virtual router
resource "openstack_networking_router_v2" "router_1" {
  name = "router_1"
  external_network_id = "${var.extGateway}"
}

# create an interface between router and internal net
resource "openstack_networking_router_interface_v2" "internal_router" {
  router_id = "${openstack_networking_router_v2.router_1.id}"
  subnet_id = "${openstack_networking_router_v2.subnet1.id}"  
}
resource "type" "name" {
  
}
