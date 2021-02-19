provider "cloudeos" {
  cvaas_domain              = var.cvaas["domain"]
  cvaas_server              = var.cvaas["server"]
  service_account_web_token = var.cvaas["service_token"]
}

output EdgePublicIPs {
  value = { "Region2Edge1" : module.Region2CloudEOSEdge1.eip_public }
}
output edgePrivateIps {
  value = { "Region2Edge1" : module.Region2CloudEOSEdge1.intf_private_ips }
}

module "Region2EdgeVpc" {
  source        = "../../../module/cloudeos/aws/vpc"
  topology_name = var.topology
  clos_name     = "${var.topology}-clos-aws"
  wan_name      = "${var.topology}-wan"
  role          = "CloudEdge"
  igw_name      = "${var.topology}-Region2VpcIgw"
  cidr_block    = ["100.2.0.0/16"]
  tags = {
    Name = "${var.topology}-Region2EdgeVpc"
  }
  region = var.aws_regions["region2"]
}

module "Region2EdgeSubnet" {
  source = "../../../module/cloudeos/aws/subnet"
  subnet_zones = {
    "100.2.0.0/24" = var.availability_zone[module.Region2EdgeVpc.region]["zone1"]
    "100.2.1.0/24" = var.availability_zone[module.Region2EdgeVpc.region]["zone1"]
  }
  subnet_names = {
    "100.2.0.0/24" = "${var.topology}-Region2EdgeSubnet0"
    "100.2.1.0/24" = "${var.topology}-Region2EdgeSubnet1"
  }
  vpc_id        = module.Region2EdgeVpc.vpc_id[0]
  topology_name = module.Region2EdgeVpc.topology_name
  region        = module.Region2EdgeVpc.region
}

module "Region2CloudEOSEdge1" {
  source        = "../../../module/cloudeos/aws/router"
  role          = "CloudEdge"
  topology_name = module.Region2EdgeVpc.topology_name
  cloudeos_ami  = var.eos_amis[module.Region2EdgeVpc.region]
  keypair_name  = var.keypair_name[module.Region2EdgeVpc.region]
  vpc_info      = module.Region2EdgeVpc.vpc_info
  intf_names    = ["${var.topology}-Region2Edge1Intf0", "${var.topology}-Region2Edge1Intf1"]
  interface_types = {
    "${var.topology}-Region2Edge1Intf0" = "public"
    "${var.topology}-Region2Edge1Intf1" = "internal"
  }
  subnetids = {
    "${var.topology}-Region2Edge1Intf0" = module.Region2EdgeSubnet.vpc_subnets[0]
    "${var.topology}-Region2Edge1Intf1" = module.Region2EdgeSubnet.vpc_subnets[1]
  }
  private_ips       = { "0" : ["100.2.0.101"], "1" : ["100.2.1.101"] }
  availability_zone = var.availability_zone[module.Region2EdgeVpc.region]["zone1"]
  region            = module.Region2EdgeVpc.region
  tags = {
    "Name" = "${var.topology}-Region2CloudEOSEdge1"
  }
  primary       = true
  filename      = "../../../userdata/eos_ipsec_config.tpl"
  instance_type = var.instance_type["edge"]
}