variable "vpc_cidr" {
    default = "10.0.0.0/16"
}
variable "subnet1_cidr" {
    default = "10.0.0.0/24"
}
variable "subnet2_cidr" {
    default = "10.0.1.0/24"
}
variable "subnet_zone_1" {
  default = "us-east-1a"
}
variable "subnet_zone_2" {
  default = "us-east-1b"
}