/*================
AWS Credentials, region and Key-pair in that region
=================*/
variable "access_key" {
}

variable "secret_key" {
}

variable "region" {
  default = {
    ireland   = "eu-west-1"
    london    = "eu-west-2"
    paris     = "eu-west-3"
    frankfurt = "eu-central-1"
    stockholm = "eu-north-1"
  }
}
variable "aws_key_pairs" {
  default = {
    london    = "MA-London-KeyPair"
    Frankfurt = "MA-Frankfurt-KeyPair"
    Ireland   = "MA-Ireland-KeyPair"
    Paris     = "MA-Paris-KeyPair"
  }

}
variable "my_london_subnets" {
  default = {
    vpc1         = "10.101.0.0/16"
    vpc1_subnet1 = "10.101.1.0/24"
    vpc1_subnet2 = "10.101.2.0/24"
    vpc1_subnet3 = "10.101.3.0/24"
  }
}
variable "my_frankfurt_subnets" {
  default = {
    vpc1         = "10.101.0.0/16"
    vpc1_subnet1 = "10.101.1.0/24"
    vpc1_subnet2 = "10.101.2.0/24"
    vpc1_subnet3 = "10.101.3.0/24"
  }
}
  