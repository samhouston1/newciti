variable "region" {
  type    = string
  default = "us-east-2"
}
variable "ami_id" {
  type = map(any)
  default = {
    us-east-1    = "ami-0ab4d1e9cf9a1215a"
    us-east-2    = "ami-0277b52859bac6f4b"
    eu-central-1 = "ami-9787h5h6nsn75gd33"
  }
}



variable "key_name" {
  type    = string
  default = "citi-test"
}

variable "aws_secret_key" {}
variable "aws_access_key" {}



variable "instance_type" {
  type = string
  default = "t2.micro"
}




variable "ports" {
  type    = list(number)
  default = [22, 80, 443, 8080, 8081]
}