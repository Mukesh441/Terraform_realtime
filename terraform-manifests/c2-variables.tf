#input variables

#aws region
variable "aws_region" {
    description = "Region in which AWS resources are created"
    type = string
    default = "us-east-1"  
}

#aws Instance Type
variable "instance_type_list" {
    description = "EC2 Instance type"
    type = list(string)
    default = ["t3.micro" , "t2.small" ,"t3.large"]
}

variable "instance_type_map" {
    description = "EC2 Instance type"
    type = map(string)
    default = {"dev" = "t3.micro" , 
               "qa"  = "t3.micro"
               "prod" = "t3.large" }
}

variable "instance_keypair" {
    description = "EC2 Instance type Key pair"
    type = string
    default = "MUKUKEYPAIR"  
}

variable "vpc_id" {
    description = "vpc id "
    type = string
    default = "vpc-032ecd3a544cfb73e" 
}