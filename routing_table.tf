
resource "aws_route_table" "web-rtg" {
  vpc_id = aws_vpc.test.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
   route {
    cidr_block = "11.0.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = "web-rtg"
  }
}

resource "aws_route_table" "app-rtg" {
  vpc_id = aws_vpc.test.id

   route {
    cidr_block = "11.0.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = "app-rtg"
  }
}

resource "aws_route_table_association" "my_route_table_association-web" {
  subnet_id      = aws_subnet.web.id
  route_table_id = aws_route_table.web-rtg.id
}

resource "aws_route_table_association" "my_route_table_association-app" {
  subnet_id      = aws_subnet.app.id
  route_table_id = aws_route_table.app-rtg.id
}
