variable "ecomplus_sqldb" {
  type = map(any)
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "myapp"
}
variable "environment" {
  description = "The environment (e.g., dev, prod, test)"
  type        = string
  default     = "dev"
}