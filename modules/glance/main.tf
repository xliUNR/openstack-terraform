# This file contains image service code (Glance)
# Declare variables
variable "winServer2012FP" {
  description = "File path for windows server 2012 image"
}
variable "cirrOSFP" {
  description = "File path for CirrOS image"
}

# First up is flavors, which specifies virtual hardware
resource "openstack_compute_flavor_v2" "smallTest" {
  name      = "smallTest"
  ram       = "1"
  vcpus     = "1"
  disk      = "1"
  is_public = "true"
}
resource "openstack_compute_flavor_v2" "winTest" {
  name      = "smallTest"
  ram       = "2"
  vcpus     = "2"
  disk      = "15"
  is_public = "true"
}

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


# Make an image, and upload to glance

resource "openstack_images_image_v2" "WindowsServer2012" {
  name = "windowsServer2012"
  local_file_path = var.winServer2012FP
  disk_format = "qcow2"
  container_format = "bare"
  visibility = "public"  
}

resource "openstack_images_image_v2" "cirrOS" {
  name = "cirrOS"
  local_file_path = var.cirrOSFP
  disk_format = "qcow2"
  container_format = "bare"
  visibility = "public"
}