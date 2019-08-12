# This is the main file for the root node. This will call other modules

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


# Create network using network module
module "neutron" {
  source = "./modules/neutron"
  # Now here you can add variables used in the modules
  # But for now it is all hardcoded.
}

module "glance" {
  source = "./modules/glance"
  
}
