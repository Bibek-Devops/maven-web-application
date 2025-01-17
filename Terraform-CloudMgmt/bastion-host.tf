resource "aws_instance" "bibek-bastion" {
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = "t2.micro"
  key_name               = "mykey"
  subnet_id              = module.vpc.public_subnets[0]
  count                  = var.instance_count
  vpc_security_group_ids = [aws_security_group.bibek-bastion-sg.id]

  tags = {
    Name    = "bibek-bastion"
    PROJECT = "bibek"
  }

  provisioner "file" {
    content     = templatefile("templates/db-deploy.tmpl", { rds-endpoint = aws_db_instance.bibek-rds.address, dbuser = var.dbuser, dbpass = var.dbpass })
    destination = "/tmp/bibek-dbdeploy.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bibek-dbdeploy.sh",
      "sudo /tmp/bibek-dbdeploy.sh"
    ]
  }

  connection {
    user        = var.USERNAME
    private_key = file(var.PRIV_KEY_PATH)
    host        = self.public_ip
  }
  depends_on = [aws_db_instance.bibek-rds]
}