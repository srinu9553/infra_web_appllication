resource "aws_subnet" "web" {
    vpc_id = aws_vpc.test.id
    cidr_block = "11.0.1.0/24"
    map_public_ip_on_launch="true"
    availability_zone="ap-south-1a"

    tags = {
        name="web"
    }
  
}


resource "aws_subnet" "app" {
    vpc_id = aws_vpc.test.id
    cidr_block = "11.0.2.0/24"
    map_public_ip_on_launch="false"
    availability_zone="ap-south-1a"

    tags = {
        name="app"
    }
  
}

resource "aws_subnet" "web-2" {
    vpc_id = aws_vpc.test.id
    cidr_block = "11.0.3.0/24"
    map_public_ip_on_launch="true"
    availability_zone="ap-south-1b"

    tags = {
        name="web-2"
    }
  
}


resource "aws_subnet" "app-2" {
    vpc_id = aws_vpc.test.id
    cidr_block = "11.0.4.0/24"
    map_public_ip_on_launch="false"
    availability_zone="ap-south-1b"

    tags = {
        name="app-2"
    }
  
}