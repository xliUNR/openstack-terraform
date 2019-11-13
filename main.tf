# This is the main file for the root node. This will call other modules
# Create network using network module
module "neutron" {
  source = "./modules/neutron"
  # Now here you can add variables used in the modules
  # But for now it is all hardcoded.
}
# Create flavors and upload images to Glance
module "glance" {
  source = "./modules/glance"
  winServer2012FP = "${var.winServer2012FP}" #file path of image must be passed in
  cirrOSFP = "${var.cirrOSFP}"
  #local_file_path="/root/images/windows_server_2012_r2_standard_eval_kvm_20170321.qcow2"
}

# Spin up instances using Nova
module "nova" {
  source = "./modules/nova"
}
