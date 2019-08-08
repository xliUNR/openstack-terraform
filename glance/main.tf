# This file contains image service code (Glance)

# First up is flavors, which specifies viortual hardware
resource "openstack_compute_flavor_v2" "windows_4gb_8cpu_40gb" {
  name      = "windows_4gb_8cpu_40gb"
  ram       =  "4096"
  vcpus     = "8"
  disk      = "40"
  is_public = "true"
}

resource "openstack_compute_flavor_v2" "windows_4gb_8cpu_60gb" {
  name      = "windowsL"
  ram       = "4096"
  vcpus     = "8"
  disk      = "60"
  is_public = "true"
}

resource "openstack_compute_flavor_v2" "windows_8gb_8cpu_60gb" {
  name      = "windows_8gb_16cpu_60gb"
  ram       = "8192"
  vcpus     = "8"
  disk      = "60"
  is_public = "true"
}

resource "openstack_compute_flavor_v2" "windows_8gb_16cpu_40gb" {
  name      = "windows_8gb_16cpu_40gb"
  ram       = "8192"
  vcpus     = "16"
  disk      = "40"
  is_public = "true"
}

