variable AWS_REGION {
    default = "ap-south-1"
  
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


variable rmquser {
  default = "rabbit"
}

variable rmqpass {
  default = "Gr33n@pple123456"
}

variable dbuser {
  default = "admin"
}

variable dbpass {
  default = "admin123"
}

variable dbname {
  default = "accounts"
}

variable instance_count {
  default = "1"
}

variable VPC_NAME {
  default = "bibek-VPC"
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


variable VpcCIDR {
  default = "172.21.0.0/16"
}


variable PubSub1CIDR {
  default = "172.21.1.0/24"
}

variable PubSub2CIDR {
  default = "172.21.2.0/24"
}

variable PubSub3CIDR {
  default = "172.21.3.0/24"
}

variable PrivSub1CIDR {
  default = "172.21.4.0/24"
}

variable PrivSub2CIDR {
  default = "172.21.5.0/24"
}

variable PrivSub3CIDR {
  default = "172.21.6.0/24"
}