resource "aws_s3_bucket" "static-s3" {
    bucket = var.s3_bucket_name
    
    tags = {
        Name = "static web hosting "
        Environment = "Dev"
    }
}
