terraform {
  required_version = ">= 1.10"

  backend "s3" {
    bucket         = "my-unique-terraform-state-bucket"
    key            = "global/s3/terraform.tfstate"   #path to your terraform.tfstate
    region         = "us-east-1"
    encrypt        = true
    
    # Enable native S3 locking (Available from Terraform onwards 1.10.0 instead of DynamoDB)
    use_lockfile   = true 
  }
}
