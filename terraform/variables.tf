variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for Public Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for Private Subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "my_ip" {
  description = "My IP address to allow SSH access to Public EC2"
  type        = string
  default     = "14.187.93.155/32"
}

variable "key_name" {
  description = "Name of the existing EC2 key pair"
  type        = string
  default     = "lab1-aws-key"
}
