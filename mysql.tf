resource "aws_db_instance" "rds" {
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t2.micro"
  name              = "wordpress"
  username          = "wpuser"
  password          = "wpuser60641"
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.db.id]
  skip_final_snapshot    = "true"

}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.priv-1.id,aws_subnet.priv-2.id,aws_subnet.priv-3.id]

  tags = {
    Name = "My DB subnet group"
  }
}