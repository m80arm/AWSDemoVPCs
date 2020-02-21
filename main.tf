/*================
AWS Providers and Regions
=================*/

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  alias = "london"
  region     = var.region["london"]
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  alias = "frankfurt" 
  region     = var.region["frankfurt"]
}
/*================
Create MA-VPC-01 in London
=================*/
resource "aws_vpc" "vpc1_london" {
  provider             = aws.london
  cidr_block           = var.my_london_subnets["vpc1_london"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "MA-VPC-01"
  }
}

resource "aws_subnet" "vpc1_london_subnet1" {
  provider                = aws.london
  vpc_id                  = aws_vpc.vpc1_london.id
  cidr_block              = var.my_london_subnets["vpc1_london_subnet1"]
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "MA-VPC-01-SN-01"
  }
}

resource "aws_route_table_association" "vpc1_london_subnet1_routetable" {
  provider       = aws.london
  subnet_id      = aws_subnet.vpc1_london_subnet1.id
  route_table_id = aws_vpc.vpc1_london.default_route_table_id
}

resource "aws_subnet" "vpc1_london_subnet2" {
  provider                = aws.london
  vpc_id                  = aws_vpc.vpc1_london.id
  cidr_block              = var.my_london_subnets["vpc1_london_subnet2"]
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "MA-VPC-01-SN-02"
  }
}

resource "aws_route_table_association" "vpc1_london_subnet2_routetable" {
  provider       = aws.london
  subnet_id      = aws_subnet.vpc1_london_subnet2.id
  route_table_id = aws_vpc.vpc1_london.default_route_table_id
}

resource "aws_subnet" "vpc1_london_subnet3" {
  provider                = aws.london
  vpc_id                  = aws_vpc.vpc1_london.id
  cidr_block              = var.my_london_subnets["vpc1_london_subnet3"]
  availability_zone       = "eu-west-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "MA-VPC-01-SN-03"
  }
}

resource "aws_route_table_association" "vpc1_london_subnet3_routetable" {
  provider       = aws.london
  subnet_id      = aws_subnet.vpc1_london_subnet3.id
  route_table_id = aws_vpc.vpc1_london.default_route_table_id
}

resource "aws_default_route_table" "vpc1_london_routetable" {
  provider               = aws.london
  default_route_table_id = aws_vpc.vpc1_london.default_route_table_id
  tags = {
    Name = "MA-VPC-01-DefaultRouteTable"
  }
}
resource "aws_internet_gateway" "vpc1_london_IGW" {
  provider = aws.london
  vpc_id   = aws_vpc.vpc1_london.id
  tags = {
    Name = "MA-VPC-01-InternetGateway"
  }
}

resource "aws_route" "vcp1_london_IGW_route" {
  provider               = aws.london
  route_table_id         = aws_vpc.vpc1_london.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc1_london_IGW.id
}

/*================
Create MA-VPC-01 in Frankfurt
=================*/
resource "aws_vpc" "vpc1_frankfurt" {
  provider             = aws.frankfurt
  cidr_block           = var.my_frankfurt_subnets["vpc1_frankfurt"]
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "MA-VPC-01"
  }
}

resource "aws_subnet" "vpc1_frankfurt_subnet1" {
  provider                = aws.frankfurt
  vpc_id                  = aws_vpc.vpc1_frankfurt.id
  cidr_block              = var.my_frankfurt_subnets["vpc1_frankfurt_subnet1"]
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "MA-VPC-01-SN-01"
  }
}

resource "aws_route_table_association" "vpc1_frankfurt_subnet1_routetable" {
  provider       = aws.frankfurt
  subnet_id      = aws_subnet.vpc1_frankfurt_subnet1.id
  route_table_id = aws_vpc.vpc1_frankfurt.default_route_table_id
}

resource "aws_subnet" "vpc1_frankfurt_subnet2" {
  provider                = aws.frankfurt
  vpc_id                  = aws_vpc.vpc1_frankfurt.id
  cidr_block              = var.my_frankfurt_subnets["vpc1_frankfurt_subnet2"]
  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "MA-VPC-01-SN-02"
  }
}

resource "aws_route_table_association" "vpc1_frankfurt_subnet2_routetable" {
  provider       = aws.frankfurt
  subnet_id      = aws_subnet.vpc1_frankfurt_subnet2.id
  route_table_id = aws_vpc.vpc1_frankfurt.default_route_table_id
}

resource "aws_subnet" "vpc1_frankfurt_subnet3" {
  provider                = aws.frankfurt
  vpc_id                  = aws_vpc.vpc1_frankfurt.id
  cidr_block              = var.my_frankfurt_subnets["vpc1_frankfurt_subnet3"]
  availability_zone       = "eu-central-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "MA-VPC-01-SN-03"
  }
}

resource "aws_route_table_association" "vpc1_frankfurt_subnet3_routetable" {
  provider       = aws.frankfurt
  subnet_id      = aws_subnet.vpc1_frankfurt_subnet3.id
  route_table_id = aws_vpc.vpc1_frankfurt.default_route_table_id
}

resource "aws_default_route_table" "vpc1_frankfurt_routetable" {
  provider               = aws.frankfurt
  default_route_table_id = aws_vpc.vpc1_frankfurt.default_route_table_id
  tags = {
    Name = "MA-VPC-01-DefaultRouteTable"
  }
}
resource "aws_internet_gateway" "vpc1_frankfurt_IGW" {
  provider = aws.frankfurt
  vpc_id   = aws_vpc.vpc1_frankfurt.id
  tags = {
    Name = "MA-VPC-01-InternetGateway"
  }
}

resource "aws_route" "vpc1_frankfurt_IGW_route" {
  provider               = aws.frankfurt
  route_table_id         = aws_vpc.vpc1_frankfurt.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc1_frankfurt_IGW.id
}