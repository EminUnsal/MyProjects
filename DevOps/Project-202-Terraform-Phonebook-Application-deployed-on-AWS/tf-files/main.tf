data "aws_vpc" "selected" {
  default = true
}

data "aws_subnets" "example" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

data "aws_ami" "amzon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

}

resource "aws_launch_template" "asg-lt" {
  name                   = "phonebook-lt"
  image_id               = data.aws_ami.amzon-linux-2.id
  instance_type          = "t2.micro"
  key_name               = "First_Key"
  vpc_security_group_ids = [aws_security_group.server-sg.id]
  depends_on = [github_repository_file.dbendpoint]
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Web Server of Phonebook App"
    }
  }

  user_data = filebase64("${abspath(path.module)}/user-data.sh")
}

resource "aws_lb_target_group" "app-alb-tg" {
  name        = "phonebook-lb-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.selected.id
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }
}

resource "aws_lb" "app-lb" {
  name               = "phonebook-lb-tf"
  ip_address_type    = "ipv4"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = data.aws_subnets.example.ids
}

resource "aws_lb_listener" "app-listener" {
  load_balancer_arn = aws_lb.app-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app-alb-tg.arn
  }
}

resource "aws_autoscaling_group" "app-asg" {
  name = "phonebook-asg"
  #vpc_zone_identifier = data.aws_subnets.example.ids
  vpc_zone_identifier       = aws_lb.app-lb.subnets
  desired_capacity          = 2
  max_size                  = 3
  min_size                  = 1
  health_check_type         = "ELB"
  health_check_grace_period = 300
  target_group_arns = [ aws_lb_target_group.app-alb-tg.arn ]
  launch_template {
    id      = aws_launch_template.asg-lt.id
    version = "$Latest"
  }
}

resource "aws_db_instance" "db-server" {
  allocated_storage           = 20
  db_name                     = "phonebook"
  engine                      = "mysql"
  engine_version              = "8.0.23"
  instance_class              = "db.t2.micro"
  username                    = "admin"
  password                    = "Oliver_1"
  skip_final_snapshot         = true
  vpc_security_group_ids      = [aws_security_group.db-sg.id]
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = true
  backup_retention_period     = 0
  identifier                  = "phonebook-app-db"
  monitoring_interval         = 0
  multi_az                    = false
  port                        = 3306
  publicly_accessible         = false
}

resource "github_repository_file" "dbendpoint" {
  repository          = "Phonebook"
  branch              = "main"
  file                = "dbserver.endpoint"
  content             = aws_db_instance.db-server.address
  commit_message      = "DB Endpoint added"
  overwrite_on_create = true
}