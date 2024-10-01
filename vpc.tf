# Create a VPC
resource "aws_vpc" "test" {
  cidr_block = "11.0.0.0/16"

  tags = {

    name="testing-vpc"
  }

}

