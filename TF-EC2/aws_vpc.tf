resource "aws_vpc" "main"{
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "Kshitiz VPC"
    }
}
resource "aws_subnet" "public_subnets" {
    count = length(var.public_subnet_cidrs)
    vpc_id = aws_vpc.main.id 
    cidr_block = element(var.public_subnet_cidrs,count.index)
    availability_zone = element(var.azs,count.index)
    tags = {
        Name = "Public subnet ${count.index+1}"
    }
}
resource "aws_subnet" "private_subnet"{
    count = length(var.private_subnet_cidrs)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.private_subnet_cidrs,count.index)
    availability_zone = element(var.azs,count.index)
    tags = {
        Name = "Private subnet ${count.index+1}"
    }
}
resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main.id
    
    tags = {
        Name = "Kshitiz VPC IGW"
    }
}
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id 
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
        Name = "Public Route Table"
    }
}
resource "aws_route_table_association" "public_subnet_asso" {
    count = length(var.public_subnet_cidrs)
    subnet_id = element(aws_subnet.public_subnets[*].id,count.index)
    route_table_id = aws_route_table.public_rt.id
}