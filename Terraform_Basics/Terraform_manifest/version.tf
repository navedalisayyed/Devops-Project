#Terraform Block

terraform {

    required_version = ">=1.0.0"
    required_providers {
     aws = {
       source = "hashicorp/aws"
       version = "~> 6.0.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }
      

    }

    
}

#Provider Block
provider "aws" {
    region = "us-east-1"
  
}




/*
~> 6.0 - in production grade, the best recomemendation option is MAJOR VERSION UPGRADE NOT recommended
6.x ---6.1 to 6.x  
7.x will not allowed

>= 6.0
6.x
7.x
8.x and so on


~> 6.0.0
6.0.1
6.0.x

6.1 is not allowd

*/
