data "aws_region" "current" {}

resource "aws_vpc" "minecraft_vpc" {
  cidr_block           = "10.0.0.0/16"
}

resource "aws_internet_gateway" "minecraft_igw" {
  vpc_id = aws_vpc.minecraft_vpc.id
}

resource "aws_default_route_table" "minecraft_default_route" {
  default_route_table_id = aws_vpc.minecraft_vpc.default_route_table_id
}

resource "aws_route" "minecraft_route" {
  route_table_id         = aws_vpc.minecraft_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.minecraft_igw.id
  depends_on             = [aws_internet_gateway.minecraft_igw]
}

resource "aws_subnet" "minecraft_subnet" {
  availability_zone       = var.availability_zone
  vpc_id                  = aws_vpc.minecraft_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  depends_on              = [aws_internet_gateway.minecraft_igw]
}
