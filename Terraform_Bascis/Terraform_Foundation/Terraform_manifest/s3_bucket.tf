#Resource Block :Random string
resource "random_string" "suffix" {
    length = 6
    special = false
    upper = false
  
}




#Resource Block : AWS S3 Bucket
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "devopsdemo-${random_string.suffix.result}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


/*
Arguement reference 
What we provide before creating the resource

Attribute Reference
After the resource has been created all the metdata can access for the resource

*/
