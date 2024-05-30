variable "aws_region" {
  type   = string
  default = "us-east-1"
}
variable "vpc_id" {
  type   = string
  default = "vpc-04e7963fb00fe63f6"
}

variable "key_name" {
  type   = string
  default = "olawale"
}
variable "ports" {
  type    = list(number)
  default = [22, 8080, 8081]

}

variable "cidr_block" {
  type       = string
  default = "172.31.0.0/16"
}

variable "ami"{
    type = string
      default = "ami-0d94353f7bad10668"
}
