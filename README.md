# AWS Helpers Terraform Module

This module allows you to simplify the management of AWS infrastructure with Terraform.

## Usage

For example, if you manage your ECS cluster with Terraform, but deployment is handled via 3rd-party tools (CI and so on), you can update `aws_ecs_task_definition` while keeping the current Docker image version as follows:

```hcl
module "current_website_docker_image" {
  source               = "andrei-shabanski/ecs-helpers/aws"
  cluster_arn          = aws_ecs_cluster.foo.arn
  service_name         = "service"
  container_name       = "web"
  default_docker_image = "hello-world:1"
}

resource "aws_ecs_cluster" "foo" {
  name = "foo"
}

resource "aws_ecs_task_definition" "foo" {
  family = "service"
  container_definitions = jsonencode([
    {
      #
      image     = module.current_website_docker_image.docker_image
      name      = "web"
      cpu       = 10
      memory    = 512
      essential = true
    }
  ])
}
```
