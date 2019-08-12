# This file contains the network infrastructure using neutron service
#create an external provider network
resource "openstack_networking_network_v2" "provider" {
  name     = "provider"
  external = "true"
  shared   = "true"
  segments {
	physical_network = "provider"
	network_type     = "flat"
   }
}
#
# create external subnet
resource "openstack_networking_subnet_v2" "external_subnet_1" {
  name            = "external_subnet_1"
  cidr            = "134.197.20.175/24"
  #dns_nameservers = ["127.0.0.53"]
  dns_nameservers = ["134.197.5.1", "134.197.6.1"]
  network_id      = "${openstack_networking_network_v2.provider.id}"	
  enable_dhcp = "true" 
  allocation_pool {
    start = "134.197.20.190" 
    end   = "134.197.20.195"
  }
}


# create internal self service network
resource "openstack_networking_network_v2" "internalNet_1" {
  name = "internalNet_1"
  admin_state_up = "true"
}

# create test subnet
resource "openstack_networking_subnet_v2" "subnet1" {
  name = "subnet_1"
  network_id = "${openstack_networking_network_v2.internalNet_1.id}"
  cidr = "192.168.1.20/24" # This choice is arbitrary
  ip_version = 4
  dns_nameservers = ["134.197.5.1", "134.197.6.1"]
  #dns_nameservers = ["127.0.0.53"]
  
}

# create a virtual router
resource "openstack_networking_router_v2" "router_1" {
  name = "router_1"
  external_network_id = "${openstack_networking_network_v2.provider.id}"
}

/*# create external router
resource "openstack_networking_router_v2" "extrouter" {
  name = "extrouter"
  external_network_id = "${openstack_networking_network_v2.provider.id}"
}
*/
# create an interface between router and internal net
resource "openstack_networking_router_interface_v2" "subnet1_if" {
  router_id = "${openstack_networking_router_v2.router_1.id}"
  subnet_id = "${openstack_networking_subnet_v2.subnet1.id}"  
}

/*
resource "type" "name" {
  
}
*/
