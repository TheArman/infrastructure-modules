data "aws_secretsmanager_secret" "example" {
  name = "the_armanv"
  depends_on = [
    aws_secretsmanager_secret.example
  ]
}

data "aws_secretsmanager_secret_version" "secret" {
  secret_id = data.aws_secretsmanager_secret.example.id
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.env}-${var.rds_name}-rds"
  subnet_ids = var.subnet_ids
}

resource "aws_db_parameter_group" "log_db_parameter" {
  name   = "logs"
  family = "mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}

resource "aws_db_instance" "this" {
  # identifier              = "my-database"
  username                = var.rds_username
  skip_final_snapshot     = true
  publicly_accessible     = false
  password                = data.aws_secretsmanager_secret_version.secret.secret_string
  parameter_group_name    = aws_db_parameter_group.log_db_parameter.name
  instance_class          = var.instance_class
  engine_version          = var.rds_engine_version
  db_name                 = var.rds_db_name
  engine                  = var.rds_engine
  db_subnet_group_name    = aws_db_subnet_group.this.name
  backup_retention_period = 7
  allocated_storage       = var.allocated_storage
  multi_az                = true
  vpc_security_group_ids  = [var.sgp]

  tags = {
    Name = var.default_tag
  }
}