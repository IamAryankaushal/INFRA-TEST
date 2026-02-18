resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = file("/home/aryankaushal/keys-for-infra/aws_key_pair.pub")
}

module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"

  name = "${var.project_name}-ec2"

  instance_type = "t3.micro"
  ami = "ami-019715e0d74f695be"
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.ssh_sg.security_group_id]
  iam_instance_profile = module.ec2_iam_role.iam_instance_profile_name
  

  associate_public_ip_address = true
  
  key_name = aws_key_pair.my_key.key_name
 

  root_block_device = [
    {
      volume_size = 10
      volume_type = "gp2"
    }
  ]

  tags = {
    project = var.project_name
  }
}
