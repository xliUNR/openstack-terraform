# This contains the configuration for nova (compute)

# First make a key pair
resource "openstack_compute_keypair_v2" "test-keypair" {
  name = "test-keypair"
}


resource "openstack_compute_instance_v2" "winServer" {
  name = "winServer"
  image_name  = "windowsServer2012"
  flavor_name = "windows_4gb_8cpu_40gb"
  key_pair = openstack_compute_keypair_v2.test-keypair.name
  security_groups = ["default"]
  network {
    name = "internalNet_1"
  }
}

