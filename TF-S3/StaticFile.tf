resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.static-s3.id
  key    = "index.html"
  source = "index.html"

  etag = filemd5("index.html")
  content_type = "text/html"
}