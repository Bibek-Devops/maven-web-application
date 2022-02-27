terraform{
    backend "s3" {
        bucket = "bibekbucket"
        key = "terraform/backend"
        region = "ap-south-1"
    }
}