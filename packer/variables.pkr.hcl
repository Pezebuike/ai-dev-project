variable "ami_name" {
  type        = string
  description = "The name of the AMI to create"

  # Default value for the AMI name added to the variable definition in variables.pkr.hcl
  default = "packer-ubuntu-{{timestamp}}"
}

variable "region" {
  type        = string
  description = "The AWS region to create the AMI in"
  default     = "us-east-1"
}
variable "instance_type" {
  type        = string
  description = "The instance type to use for the build"
  default     = "t2.micro"
}
variable "ssh_username" {
  type        = string
  description = "The SSH username to use for the build"
  default     = "ubuntu"
}
