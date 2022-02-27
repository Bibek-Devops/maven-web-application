provider "aws" {
    region = "ap-south-1"
    # don't keep here access_key = ""
    #  do at the time of install secret_key = ""
  }
# gitve the resource name to acces aws instance
resource "aws_instance" "intro" {
    ami = "ami-0c6615d1e95c98aca"
    instance_type="t2.micro"
    availability_zone="ap-south-1a"
    key_name="devopsbegin"
    vpc_security_group_ids=["sg-00dd602d69f8365d5"]

    tags = {
        Name = "Devpos-Instance"
    }   
}
