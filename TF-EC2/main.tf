provider "aws" {
  region = var.aws_region
}

resource "aws_launch_template" "kshitiz_lt" {
  name = "kshitiz-template"
  image_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [var.security_group_ids]

  user_data = <<EOF
#!/bin/bash
yum update -y
yum install httpd -y
service httpd start
chkconfig httpd on
cd /var/www/html
echo "<html><h1>Welcome To My Webpage</h1></html>" > index.html
EOF

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Kshitiz-ASG-Instance"
    }
  }
}

resource "aws_autoscaling_group" "kshitiz_asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

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