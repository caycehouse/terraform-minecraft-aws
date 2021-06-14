variable "availability_zone"  {}
variable "instance_type" {}
variable "volume_size" {}
variable "volume_type" {}
variable "subnet_id" {}
variable "security_groups"  {}
variable "iam_instance_profile" {
    default = ""
}
variable "key_name" {
    default = ""
}
variable "user_data" {
    default = ""
}