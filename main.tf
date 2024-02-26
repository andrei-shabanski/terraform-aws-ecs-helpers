data "aws_ecs_service" "service" {
  cluster_arn  = var.cluster_arn
  service_name = var.service_name
}

data "aws_ecs_container_definition" "service" {
  task_definition = data.aws_ecs_service.service.task_definition
  container_name  = var.container_name
}

locals {
  docker_image = !var.return_default_docker_image && length(data.aws_ecs_container_definition.service.image) > 0 ? data.aws_ecs_container_definition.service.image : var.default_docker_image
}
