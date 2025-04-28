resource "aws_autoscaling_group" "webapp_asg" {
  name                      = "${var.project_name}-asg"
  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  vpc_zone_identifier       = [aws_subnet.public_a.id, aws_subnet.public_b.id]
  health_check_type         = "EC2"
  target_group_arns         = [aws_lb_target_group.tg.arn]
  launch_template {
    id      = aws_launch_template.webapp_lt.id
    version = "$Latest"
  }
}
