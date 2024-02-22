variable "region" {
  description = "AWS Region"
  default     = "us-east-2"
}

variable "cluster_arn" {
  type        = string
  description = "The ARN of ECS cluster."
}

variable "service_name" {
  type        = string
  description = "The ECS service name."
}

variable "container_name" {
  type        = string
  description = "The container name."
}

variable "default_docker_image" {
  type        = string
  description = "The default docker image."
}
