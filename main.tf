/*================
AWS Providers and Regions
=================*/

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  alias = "london"
  region     = var.region["london"]
}

/*================
Create MA-VPC-01 in London
=================*/
resource "aws_vpc" "vpc1_london_01" {
  provider             = aws.london
  cidr_block           = var.my_london_01_subnets["vpc1_london_01"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "MA-VPC-01"
  }
}

resource "aws_subnet" "vpc1_london_01_subnet1" {
  provider                = aws.london
  vpc_id                  = aws_vpc.vpc1_london_01.id
  cidr_block              = var.my_london_01_subnets["vpc1_london_01_subnet1"]
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "MA-VPC-01-SN-01"
  }
}

resource "aws_route_table_association" "vpc1_london_01_subnet1_routetable" {
  provider       = aws.london
  subnet_id      = aws_subnet.vpc1_london_01_subnet1.id
  route_table_id = aws_vpc.vpc1_london_01.default_route_table_id
}

resource "aws_subnet" "vpc1_london_01_subnet2" {
  provider                = aws.london
  vpc_id                  = aws_vpc.vpc1_london_01.id
  cidr_block              = var.my_london_01_subnets["vpc1_london_01_subnet2"]
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "MA-VPC-01-SN-02"
  }
}

resource "aws_route_table_association" "vpc1_london_01_subnet2_routetable" {
  provider       = aws.london
  subnet_id      = aws_subnet.vpc1_london_01_subnet2.id
  route_table_id = aws_vpc.vpc1_london_01.default_route_table_id
}

resource "aws_subnet" "vpc1_london_01_subnet3" {
  provider                = aws.london
  vpc_id                  = aws_vpc.vpc1_london_01.id
  cidr_block              = var.my_london_01_subnets["vpc1_london_01_subnet3"]
  availability_zone       = "eu-west-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "MA-VPC-01-SN-03"
  }
}

resource "aws_route_table_association" "vpc1_london_01_subnet3_routetable" {
  provider       = aws.london
  subnet_id      = aws_subnet.vpc1_london_01_subnet3.id
  route_table_id = aws_vpc.vpc1_london_01.default_route_table_id
}

resource "aws_default_route_table" "vpc1_london_01_routetable" {
  provider               = aws.london
  default_route_table_id = aws_vpc.vpc1_london_01.default_route_table_id
  tags = {
    Name = "MA-VPC-01-DefaultRouteTable"
  }
}
resource "aws_internet_gateway" "vpc1_london_01_IGW" {
  provider = aws.london
  vpc_id   = aws_vpc.vpc1_london_01.id
  tags = {
    Name = "MA-VPC-01-InternetGateway"
  }
}

resource "aws_route" "vcp1_london_01_IGW_route" {
  provider               = aws.london
  route_table_id         = aws_vpc.vpc1_london_01.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc1_london_01_IGW.id
}

/*================
Create MA-VPC-02 in London
=================*/
resource "aws_vpc" "vpc1_london_02" {
  provider             = aws.london
  cidr_block           = var.my_london_02_subnets["vpc1_london_02"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "MA-VPC-02"
  }
}

resource "aws_subnet" "vpc1_london_02_subnet1" {
  provider                = aws.london
  vpc_id                  = aws_vpc.vpc1_london_02.id
  cidr_block              = var.my_london_02_subnets["vpc1_london_02_subnet1"]
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "MA-VPC-02-SN-01"
  }
}

resource "aws_route_table_association" "vpc1_london_02_subnet1_routetable" {
  provider       = aws.london
  subnet_id      = aws_subnet.vpc1_london_02_subnet1.id
  route_table_id = aws_vpc.vpc1_london_02.default_route_table_id
}

resource "aws_subnet" "vpc1_london_02_subnet2" {
  provider                = aws.london
  vpc_id                  = aws_vpc.vpc1_london_02.id
  cidr_block              = var.my_london_02_subnets["vpc1_london_02_subnet2"]
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "MA-VPC-02-SN-02"
  }
}

resource "aws_route_table_association" "vpc1_london_02_subnet2_routetable" {
  provider       = aws.london
  subnet_id      = aws_subnet.vpc1_london_02_subnet2.id
  route_table_id = aws_vpc.vpc1_london_02.default_route_table_id
}

resource "aws_subnet" "vpc1_london_02_subnet3" {
  provider                = aws.london
  vpc_id                  = aws_vpc.vpc1_london_02.id
  cidr_block              = var.my_london_02_subnets["vpc1_london_02_subnet3"]
  availability_zone       = "eu-west-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "MA-VPC-02-SN-03"
  }
}

resource "aws_route_table_association" "vpc1_london_02_subnet3_routetable" {
  provider       = aws.london
  subnet_id      = aws_subnet.vpc1_london_02_subnet3.id
  route_table_id = aws_vpc.vpc1_london_02.default_route_table_id
}

resource "aws_default_route_table" "vpc1_london_02_routetable" {
  provider               = aws.london
  default_route_table_id = aws_vpc.vpc1_london_02.default_route_table_id
  tags = {
    Name = "MA-VPC-02-DefaultRouteTable"
  }
}
resource "aws_internet_gateway" "vpc1_london_02_IGW" {
  provider = aws.london
  vpc_id   = aws_vpc.vpc1_london_02.id
  tags = {
    Name = "MA-VPC-02-InternetGateway"
  }
}

resource "aws_route" "vcp1_london_02_IGW_route" {
  provider               = aws.london
  route_table_id         = aws_vpc.vpc1_london_02.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc1_london_02_IGW.id
}