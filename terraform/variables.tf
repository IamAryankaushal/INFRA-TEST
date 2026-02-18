variable "aws_region" {
  default = "ap-south-1"
  type    = string
}

variable "project_name" {
  default = "infra-testing-framework"
  type    = string
}

variable "ssh_allowed_cidr" {
  description = "Your IP in CIDR format"
  type        = string
}

variable "public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "/home/aryankaushal/keys-for-infra/aws_key_pair.pub"
}


