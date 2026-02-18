module "ssh_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "${var.project_name}-ssh-sg"
  description = "Allow SSH only"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = var.ssh_allowed_cidr
    }
  ]

  egress_rules = ["all-all"]

  tags = {
    project = var.project_name
  }
}
