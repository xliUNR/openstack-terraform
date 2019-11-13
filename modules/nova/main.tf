# This contains the configuration for nova (compute)

# First make a key pair
/*resource "openstack_compute_keypair_v2" "test-keypair" {
  name = "test-keypair"
}*/

# Windows test image
resource "openstack_compute_instance_v2" "winSTest" {
  name = "winSTest"
  image_name  = "windowsServer2012"
  flavor_name = "winTest"
  #key_pair = openstack_compute_keypair_v2.test-keypair.name
  security_groups = ["default"]
  network {
    name = "internalNet_1"
  }
}
# CirrOS test image
resource "openstack" "cirrTest" {
  name = "cirrTest"
  image_name = "cirrOS"
  flavor_name = "smallTest"
  security_groups = ["default"]
  network{
    name = "internalNet_1"
  }
}
resource "openstack_compute_instance_v2" "cirrOSTest"