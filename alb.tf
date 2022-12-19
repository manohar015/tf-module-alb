resource "aws_lb" "alb" {
  name               = var.ALB_NAME
  internal           = var.INTERNAL
  load_balancer_type = "application"
  security_groups    = var.INTERNAL ? aws_security_group.alb_private.*.id : aws_security_group.alb_public.*.id  # Conditional expression
  subnets            = var.INTERNAL ? data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS : data.terraform_remote_state.vpc.outputs.PUBLIC_SUBNET_IDS
  tags = {
    Environment = var.ALB_NAME
  }
}


# local.deploy_b59webapp == true ? 1 : 0