resource "aws_db_subnet_group" "rds_subnets" {
  name       = "${var.project_name}-rds-subnets"
  subnet_ids = module.vpc.private_subnets

  tags = {
    project = var.project_name
  }
}

resource "aws_db_instance" "mysql" {
  identifier             = "${var.project_name}-db"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = "admin"
  password               = "Password123!"
  publicly_accessible    = true
  skip_final_snapshot    = true
  deletion_protection    = false

  vpc_security_group_ids = [module.ssh_sg.security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnets.name

  tags = {
    project = var.project_name
  }
}
