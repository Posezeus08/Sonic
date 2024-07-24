variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "us-east-1"
}

variable "app_name" {
  description = "The name of the application"
  default     = "poet-api"
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  default     = "poet-api"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "poet-cluster"
}

variable "container_port" {
  description = "Port exposed by the docker image"
  default     = 8000
}

variable "cpu" {
  description = "Fargate instance CPU units to provision"
  default     = "256"
}

variable "memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "512"
}

variable "desired_count" {
  description = "Number of docker containers to run"
  default     = 1
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
}