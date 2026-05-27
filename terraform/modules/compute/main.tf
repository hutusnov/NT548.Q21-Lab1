resource "aws_instance" "public" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name

  vpc_security_group_ids = [var.public_sg_id]

  tags = {
    Name = "${var.project_name}-public-instance"
  }
}

resource "aws_instance" "private" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  key_name      = var.key_name

  vpc_security_group_ids = [var.private_sg_id]

  tags = {
    Name = "${var.project_name}-private-instance"
  }
}
