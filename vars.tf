variable "hosted_zone_id" {
  description = "Value of the Hosted Zone ID for the Route53 zone"
  type        = string
  default     = "Zxxxxxxxxxxxxxxxx"
}

variable "record_name" {
  description = "The dns record to update on start"
  type        = string
  default     = "mc.example.com"
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

variable "key_name" {
  description = "SSH Keypair name to use"
  type        = string
  default     = ""
}

variable "spot_price" {
  description = "The spot price to use"
  type        = string
  default     = "0.05"
}

variable "mc_memory" {
  description = "The memory to allocate to java"
  type        = string
  default     = "6144M"
}

variable "mc_type" {
  description = "The minecraft server type to run"
  type        = string
  default     = "VANILLA"
}