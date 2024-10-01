resource "aws_subnet" "web-1a" {
    vpc_id = aws_vpc.test.id
    cidr_block = "11.0.1.0/24"
    map_public_ip_on_launch="true"
    availability_zone="ap-south-1a"

    tags = {
        name="web-1a"
    }
  
}


resource "aws_subnet" "app-1a" {
    vpc_id = aws_vpc.test.id
    cidr_block = "11.0.2.0/24"
    map_public_ip_on_launch="false"
    availability_zone="ap-south-1a"

    tags = {
        name="app-1a"
    }
  
}

resource "aws_subnet" "web-1b" {
    vpc_id = aws_vpc.test.id
    cidr_block = "11.0.3.0/24"
    map_public_ip_on_launch="true"
    availability_zone="ap-south-1b"

    tags = {
        name="web-1b"
    }
  
}
