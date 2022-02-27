variable REGION {
  default = "ap-south-1"
}

variable ZONE1 {
  default = "ap-south-1a"
}

variable ZONE2 {
  default = "ap-south-1b"
}

variable ZONE3 {
  default = "ap-south-1c"
}

variable AMIS {
  type = map
  default = {
    ap-south-1 = "ami-0c6615d1e95c98aca"
    # us-east-1 = "ami-0000000"
  }
}

variable USER {
  default = "ec2-user"
}

variable PUB_KEY {
  default = "dev-key.pub"
}

variable PRIV_KEY {
  default = "dev-key"
}

variable MYIP {
  default = "49.34.68.166/32"
}