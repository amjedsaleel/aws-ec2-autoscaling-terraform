variable "profile" {
  type        = string
  default     = "personal"
  description = "Configuration profile name for the AWS CLI"
}

variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "Preferred location for infrastructure deployment."
}
