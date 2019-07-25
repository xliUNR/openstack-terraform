#  Setup input variables, don't want secrets in .tf
variable "oRegion" {
  description = "Openstack region"
  default = "RegionOne"
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

#create an external provider network
resource "openstack_networking_network_v2" "extnet" {
  name     = "extnet"
  external = "true"
  shared   = "true"
  segments {
	physical_network = "provider"
	network_type     = "flat"
   }
}

# create external subnet
resource "openstack_networking_subnet_v2" "external_subnet_1" {
  name            = "external_subnet_1"
  cidr            = "134.197.20.175/24"
  dns_nameservers = ["127.0.0.53"]
  network_id      = "${openstack_networking_network_v2.extnet.id}"	
  enable_dhcp = "true"
  allocation_pool {
    start = "134.197.20.190" 
    end   = "134.197.20.200"
  }
}

/*
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
  dns_nameservers = ["8.8.8.8"]
  
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
*/
