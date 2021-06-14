variable "route53_name" {
  description = "Value of the Name tag for the Route53 zone"
  type        = string
  default     = "example.com"
}

variable "your_ip" {
  description = "This must be your public facing IP so you can SSH to your linux machine."
  default     = ["0.0.0.0/0"]
}

variable "availability_zone" {
  description = "Availability Zone to use"
  type        = string
  default     = "us-east-1a"
}

variable "instance_type" {
  description = "Instance type to use"
  type        = string
  default     = "m5.large"
}

variable "volume_size" {
  description = "Volume size in GB"
  type        = number
  default     = 10
}

variable "volume_type" {
  description = "Volume type to use"
  type        = string
  default     = "gp3"
}