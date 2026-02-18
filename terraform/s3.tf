resource "aws_s3_bucket" "report_bucket" {
  bucket = "${var.project_name}-infra-reports-${random_id.bucket_id.hex}"

  force_destroy = true

  tags = {
    project = var.project_name
  }
}

resource "random_id" "bucket_id" {
  byte_length = 4
}
