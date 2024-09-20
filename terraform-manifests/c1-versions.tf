# Terraform Block
terraform {
    required_version = ">= 1.6"  // Current version is 1.9.5
   required_providers {
     aws = {
       source  = "hashicorp/aws"
       version = ">= 5.0"
     }
   }
   }

   provider "aws" {
    region = var.aws_region //"us-east-1"
    profile = "Mukesh"     
   }