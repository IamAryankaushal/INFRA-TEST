
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "security_group_id" {
  description = "Security group attached to EC2"
  value       = module.ssh_sg.security_group_id
}


output "instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.id
}

output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = module.ec2.public_ip
}

output "iam_instance_profile" {
  description = "IAM instance profile attached to EC2"
  value       = module.ec2_iam_role.iam_instance_profile_name
}

output "report_bucket_name" {
  description = "S3 bucket for infra reports"
  value       = aws_s3_bucket.report_bucket.bucket
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.mysql.endpoint
}
