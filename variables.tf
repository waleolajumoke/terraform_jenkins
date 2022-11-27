variable "aws_region" {
  type   = string
  default = "us-east-2"
}
variable "vpc_id" {
  type   = string
  default = "vpc-072c796880ff8b023"
}

variable "key_name" {
  type   = string
  default = "tito"
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
    default = "ami-0beaa649c482330f7"
}
