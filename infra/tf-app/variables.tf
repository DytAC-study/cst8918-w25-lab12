variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "canadaeast"
}

variable "environment" {
  description = "The environment name"
  type        = string
  default     = "production"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "cst8918-lab12"
} 