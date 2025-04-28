resource "aws_launch_template" "webapp_lt" {
  name_prefix   = "web-1-lt-"
  image_id      = "ami-0f409bae3775dc8e5"  # ✅ Ubuntu 22.04 LTS for us-east-2
  instance_type = "t2.micro"
  key_name      = "new"  # ✅ Your EC2 key

  network_interfaces {
    device_index                = 0
    associate_public_ip_address = true  # ✅ VERY IMPORTANT to get Public IP
    security_groups             = [aws_security_group.ec2_sg.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "web-1-ec2"
    }
  }
}

