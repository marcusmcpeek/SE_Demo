// PLEASE CUSTOMIZE file for your deployment
## Search "mandatory" for parameters that need to be customized before deployment
topology = "demo" #mandatory

## Get service_token from Arista Contact and replace empty string below
cvaas = {
  domain : "apiserver.cv-staging.corp.arista.io",
  server : "www.cv-staging.corp.arista.io",
  service_token : "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJkaWQiOjE4MzkwLCJkc24iOiJUZXJyYWZvcm0gU2VydmljZSBBY2NvdW50IiwiZHN0IjoiYWNjb3VudCIsInNpZCI6IjYxZmVmODAzYjBkZmZlMGFhMWNkNmRjNWUzMWUwMmVkZjRkYjI0YTU3Mzg4YjMxYTg0YjEyMDY3NTc1YjNiMjgtdFdyNk5UQVdrSHJUT1hvREFkenlZTUZ3R294ZnVrM05Qb1lmLTRMTSJ9.I3xq1V9pWZ_JgeCUDxVpMSb9i5o9s95dRVteVgahQPnsec0YKbSZF0Gpyc_xU3yetNC3LB7rj_4WdvWuC-7LRw" # staging Central SE
  #service_token : "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJkaWQiOjE0MDY3LCJkc24iOiJtbSIsImRzdCI6ImFjY291bnQiLCJzaWQiOiJlMWI5YWNiMjgwMTVlYmY3Mzc3YTdmYmVjMzc1OTg3OTYzZTRhNjFkYmY4YTUxNzI2ODMxNmMwM2MyNzQyYmZkLUFoblBvYVdVT1IwQ0ZRenhIOXpLempNRGkxOHVrRUNKWGtoN3dPaGgifQ.ycSm06rncQTjk553LmUP6yv3TunBk8WwGR3F4jMjeNfwzzkFsUp0o3FS7ookP3v_3qyuW56n9OqxWGEn3xMiZQ" # staging corporate
}

#username = arista
#password = @rista123

## Enter keypairs that will be used to login to AWS instances
## If you don't have keypairs create them on AWS console for the following regions
keypair_name = {
  us-west-1 : "cloudeos_demo", #mandatory
  us-east-1 : "cloudeos_demo", #mandatory
  us-east-2 : "cloudeos_demo", #mandatory
}

## AWS IAM profile name that allows CloudEdge router to modify AWS routing tables
## to setup Cloud HA. Check out "CloudEdge MultiCloud Deployment Guide" or
## https://www.arista.com/en/cg-veos-router/veos-router-cloud-configuration
## on how to setup the IAM role
aws_iam_instance_profile = "ChangeRouteRole" #mandatory

## Cutomization of the parameters below are *optional*

## CloudEdge network requires three subnets for control plane
vtep_ip_cidr          = "172.16.0.0/24" // CIDR block for VTEP IPs
terminattr_ip_cidr    = "172.16.1.0/24" // Loopback IP range for CloudVision connectivity
dps_controlplane_cidr = "172.16.2.0/24" // CIDR block for VXLAN/Dps Control Plane IPs

## CloudVision container names - they need to be created on www.arista.io/cv
## before deployment. Steps to create containers on CloudVision are in
## "CloudEdge MultiCloud Deployment Guide"
clos_cv_container = "SE_Demo"
wan_cv_container  = "SE_Demo"

instance_type = {
  rr : "c5.xlarge",
  edge : "c5.xlarge",
  leaf : "c5.xlarge"
}

aws_regions = {
  region1 : "us-west-1",
  region2 : "us-east-1",
  region3 : "us-east-2"
}

azure_regions = {
  region1 : "westus2",
}

## Currently private AMIs. Contact Arista for access
eos_amis = {
  us-east-2 : "ami-0f288d79d6c54df9c",
  us-east-1 : "ami-09294bb4c66837ba9",
  us-west-1 : "ami-023b9d398d45e5d1e",
  us-west-2 : "ami-01bda3983d6485129",
  ap-east-1 : "ami-02416a3369c25adf4",
  ap-south-1 : "ami-02ffb289a15e749f2",
  ap-northeast-2 : "ami-05afb6df71e95b345",
  ap-southeast-1 : "ami-0c022f2d5f4bf735c",
  ap-southeast-2 : "ami-05d16e7c75bcdbb5c",
  ap-northeast-1 : "ami-0aeab162992b5d86b",
  ca-central-1 : "ami-0c5a12e947d33b477",
  eu-central-1 : "ami-0d36a790c9f9184e8",
  eu-west-1 : "ami-06457449fb0c0a67f",
  eu-west-2 : "ami-05c3ead0a3bb34188",
  eu-west-3 : "ami-07f2f957eab49eb25",
  eu-north-1 : "ami-0da73caeb2cd3be33",
  me-south-1 : "ami-08f26941374da7c2d",
  sa-east-1 : "ami-01b10014647135f51",
  us-gov-east-1 : "ami-919f73e0",
  us-gov-west-1 : "ami-c2b285a3",
}

availability_zone = {
  us-west-1 : { zone1 : "us-west-1b", zone2 : "us-west-1c" },
  us-east-1 : { zone1 : "us-east-1b", zone2 : "us-east-1c" },
  us-east-2 : { zone1 : "us-east-2b", zone2 : "us-east-2c" }
}

## Currently private AMIs. Contact Arista for access
host_amis = {
  us-west-1 : "ami-035dbbb5f679b91cd",
  us-east-1 : "ami-0b161e951484253ab",
  us-east-2 : "ami-083064f66d3878ff7"
}

#azure cloudeos info
subnet_info = {
  azureRR1Subnet : {
    subnet_prefixes = ["11.0.0.0/24", "11.0.1.0/24", "11.0.2.0/24", "11.0.3.0/24"]
    subnet_names    = ["rr1Subnet0", "rr1Subnet1", "rr1Subnet2", "rr1Subnet3"]
  }
  edge1subnet : {
    subnet_prefixes = ["12.0.0.0/24", "12.0.1.0/24", "12.0.2.0/24", "12.0.3.0/24", "12.0.4.0/24"]
    subnet_names    = ["edge1Subnet0", "edge1Subnet1", "edge1Subnet2", "edge1Subnet3","rr1subnet0"]
  }
  leaf1subnet = {
    subnet_prefixes = ["18.0.0.0/24", "18.0.1.0/24", "18.0.2.0/24", "18.0.3.0/24"]
    subnet_names    = ["leaf1Subnet0", "leaf1Subnet1", "leaf1Subnet2", "leaf1Subnet3"]
  }
  leaf2subnet = {
    subnet_prefixes = ["19.0.0.0/24", "19.0.1.0/24", "19.0.2.0/24", "19.0.3.0/24"]
    subnet_names    = ["leaf2Subnet0", "leaf2Subnet1", "leaf2Subnet2", "leaf2Subnet3"]
  }
}

cloudeos_info = {
  edge1cloudeos1 : {
    publicip_name = "edge1cloudeos1Pip"
    intf_names    = ["edge1cloudeos1Intf0", "edge1cloudeos1Intf1"]
    interface_types = {
      "edge1cloudeos1Intf0" = "public"
      "edge1cloudeos1Intf1" = "internal"
    }
    disk_name              = "edge1cloudeos1disk"
    private_ips            = { "0" : ["12.0.0.101"], "1" : ["12.0.1.101"] }
    route_name             = "azedge1Rt"
    routetable_name        = "azedge1RtTable"
    filename               = "../../../userdata/eos_ipsec_config.tpl"
    cloudeos_image_version = "4.24.01"
    cloudeos_image_name    = "cloudeos-4_24_0-payg-free"
    cloudeos_image_offer   = "cloudeos-router-payg"
  }
  leaf1cloudeos1 = {
    cloudeos_image_version = "4.24.01"
    cloudeos_image_name    = "cloudeos-4_24_0-payg-free"
    cloudeos_image_offer   = "cloudeos-router-payg"
    intf_names             = ["leaf1cloudeos1Intf0", "leaf1cloudeos1Intf1"]
    interface_types = {
      "leaf1cloudeos1Intf0" = "internal"
      "leaf1cloudeos1Intf1" = "private"
    }
    private_ips       = { "0" : ["18.0.0.101"], "1" : ["18.0.1.101"] }
    tags              = { "Name" : "azleaf1cloudeos1", "Cnps" : "dev" }
    disk_name         = "leaf1cloudeos1disk"
    storage_name      = "azleaf1cloudeos1storage"
    route_name        = "leaf1Rt1"
    routetable_name   = "leaf1RtTable1"
    cloud_ha          = "leaf1"
    filename          = "../../../userdata/eos_ipsec_config.tpl"
    availability_zone = [2]

  }
  leaf2cloudeos1 = {
    intf_names = ["leaf2cloudeos1Intf0", "leaf2cloudeos1Intf1"]
    interface_types = {
      "leaf2cloudeos1Intf0" = "internal"
      "leaf2cloudeos1Intf1" = "private"
    }
    availability_zone      = [2]
    private_ips            = { "0" : ["19.0.0.101"], "1" : ["19.0.1.101"] }
    disk_name              = "leaf2cloudeos1disk"
    storage_name           = "leaf2cloudeos1storage"
    route_name             = "leaf2Rt1"
    routetable_name        = "leaf2RtTable1"
    cloud_ha               = "leaf2"
    cloudeos_image_version = "4.24.01"
    cloudeos_image_name    = "cloudeos-4_24_0-payg-free"
    cloudeos_image_offer   = "cloudeos-router-payg"
    filename               = "../../../userdata/eos_ipsec_config.tpl"
  }
}
