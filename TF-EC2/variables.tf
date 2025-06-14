variable "aws_region" {
    description = "AWS region"
    default = "us-east-1"
}
variable "ami_id" {
    description = " AMI ID for EC2 instance"
    type = string
}
variable "instance_type"{
    description = " Instance Type of EC2_Instance"
    default = "t2.micro"
}
variable "key_name" {
    description = " Name of the existing EC2 Key Pair"
    type = string
}