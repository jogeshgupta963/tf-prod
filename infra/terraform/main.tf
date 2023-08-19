resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet1" {
     vpc_id = aws_vpc.myvpc.id
     cidr_block = var.subnet1_cidr
     availability_zone = var.subnet_zone_1
     map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet2" {
     vpc_id = aws_vpc.myvpc.id
     cidr_block = var.subnet2_cidr
     availability_zone = var.subnet_zone_2
     map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
     vpc_id = aws_vpc.myvpc.id
}
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id
  route = {
     cidr_block= "0.0.0.0/0",
     gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta1" {
     subnet_id = aws_subnet.subnet1.id
     route_table_id = aws_route_table.RT.id
     
}
resource "aws_route_table_association" "rta2" {
     subnet_id = aws_subnet.subnet2.id
     route_table_id = aws_route_table.RT.id
}