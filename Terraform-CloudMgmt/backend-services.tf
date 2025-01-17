resource "aws_db_subnet_group" "bibek-rds-subgrp" {
  name       = "main"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
  tags = {
    Name = "Subnet group for RDS"
  }
}

resource "aws_elasticache_subnet_group" "bibek-ecache-subgrp" {
  name       = "bibek-ecache-subgrp"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]

}

resource "aws_db_instance" "bibek-rds" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version       = "5.7"
  instance_class         = "db.t2.micro"
  name                   = var.db_name
  username               = var.dbuser
  password               = var.dbpass
  parameter_group_name = "default.mysql5.7"
  multi_az               = "false"
  publicly_accessible    = "false"
  skip_final_snapshot    = true #only for demo not reccomend in production
  db_subnet_group_name   = aws_db_subnet_group.bibek-rds-subgrp.name
  vpc_security_group_ids = [aws_security_group.bibek-backend-sg.id]
}

resource "aws_elasticache_cluster" "bibek-ecache" {
  cluster_id           = "bibek-cache"
  engine               = "memcached"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.memcached1.4"
  port                 = 11211
  security_group_ids   = [aws_security_group.bibek-backend-sg.id]
  subnet_group_name    = aws_elasticache_subnet_group.bibek-ecache-subgrp.name
}


resource "aws_mq_broker" "bibek-rmq" {
  broker_name        = "bibek-rmq"
  engine_type        = "ActiveMQ"
  engine_version     = "5.15.0"
  host_instance_type = "mq.t2.micro"
  security_groups    = [aws_security_group.bibek-backend-sg.id]
  subnet_ids         = [module.vpc.private_subnets[0]]

  user {
    username = var.rmquser
    password = var.rmqpass
  }
}