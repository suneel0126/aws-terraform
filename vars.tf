variable "ami" {
  description = "create ec2 instance for app-servers"
  default     = "ami-06e46074ae430fba6"

}

variable "instance_type" {
  default = "t2.micro"

}

variable "key-name" {
  default = "us-east-main"

}