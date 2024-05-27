
resource "aws_vpc" "default" {
  count            = var.enable ? 1 : 0
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

}
resource "aws_subnet" "main" {
  count      = var.enable ? 1 : 0
  vpc_id     = join("", aws_vpc.default.*.id)
  cidr_block = var.subnet_cidr_block

  tags = {
    Name = "ak"
  }
}
resource "aws_internet_gateway" "main" {
  count  = var.enable ? 1 : 0
  vpc_id = join("", aws_vpc.default.*.id)
}
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}
resource "aws_route_table_association" "main" {
  route_table_id = aws_route_table.main.id
  subnet_id = aws_subnet.main.id
}