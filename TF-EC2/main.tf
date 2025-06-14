provider "aws" {
  region = var.aws_region
}
data "aws_security_group" "default_vpc_sg" {
  filter {
    name = "group-name"
    values = ["default"]
  }

  filter{
    name = "vpc-id"
    values = [aws_vpc.main.id]
  }
}
resource "aws_launch_template" "kshitiz_lt" {
  name = "kshitiz-template"
  image_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [data.aws_security_group.default_vpc_sg.id]

  user_data = base64encode(<<EOF
    #!/bin/bash
    yum update -y
    yum install httpd -y
    service httpd start
    chkconfig httpd on
    cd /var/www/html
    echo "<html><h1>Welcome To My Webpage</h1></html>" > index.html
  EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Kshitiz-ASG-Instance"
    }
  }
}

resource "aws_autoscaling_group" "kshitiz_asg" {
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  vpc_zone_identifier = aws_subnet.public_subnets[*].id 

  launch_template {
    id      = aws_launch_template.kshitiz_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "Kshitiz-ASG-Instance"
    propagate_at_launch = true
  }
}