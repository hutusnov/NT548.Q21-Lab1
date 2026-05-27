data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

locals {
  project_name = "nt548-lab1"
}

module "network" {
  source              = "./modules/network"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = data.aws_availability_zones.available.names[0]
  project_name        = local.project_name
}

module "security" {
  source       = "./modules/security"
  vpc_id       = module.network.vpc_id
  my_ip        = var.my_ip
  project_name = local.project_name
}

module "compute" {
  source            = "./modules/compute"
  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id
  public_sg_id      = module.security.public_sg_id
  private_sg_id     = module.security.private_sg_id
  key_name          = var.key_name
  project_name      = local.project_name
  ami_id            = data.aws_ami.amazon_linux_2.id
  instance_type     = "t2.micro"
}
