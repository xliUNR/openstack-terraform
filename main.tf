# This is the main file for the root node. This will call other modules

# Create network using network module
module "neutron" {
  source = "./modules/neutron"
  # Now here you can add variables used in the modules
  # But for now it is all hardcoded.
}

module "glance" {
  source = "./modules/glance"
  
}
