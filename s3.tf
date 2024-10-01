resource "aws_s3_bucket" "mumbai" {
  bucket = "my-terraform-state-bucket"

  tags = {
    Name        = "terraform"
    Environment = "Dev"
  }
}

