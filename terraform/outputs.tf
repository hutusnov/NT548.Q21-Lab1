output "public_instance_public_ip" {
  value = module.compute.public_instance_ip
}

output "private_instance_private_ip" {
  value = module.compute.private_instance_ip
}

output "vpc_id" {
  value = module.network.vpc_id
}
