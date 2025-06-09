variable "s3_bucket_name" {
    description = "Name of the S3 Bucket"
    type = string
}
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"  
}