resource "aws_key_pair" "keypair" {
  key_name = "mykey"
  public_key = file(var.PUB_KEY)
}