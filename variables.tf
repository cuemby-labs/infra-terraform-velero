#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}

#
# Velero Variables
#

variable "namespace_name" {
  description = "The name of the Kubernetes namespace."
  type        = string
  default     = "velero"
}

variable "chart_version" {
  description = "The version of the Velero Helm release chart."
  type        = string
  default     = "7.2.1"
}

variable "velero_schedule" {
  description = "The cron schedule for Velero backups"
  type        = string
  default     = "@every 24h"
}

variable "velero_image" {
  description = "The image for Velero provider"
  type        = string
  default     = "velero/velero-plugin-for-aws:v1.10.0"
}

variable "velero_provider" {
  description = "Velero provider"
  type        = string
  default     = "velero.io/aws"
}

variable "velero_bucket" {
  description = "Bucket name"
  type        = string
  default     = "dev-backup"
}

variable "s3url" {
  description = "s3Url FQDN name"
  type        = string
  default     = "minio.domainname.com"
}

variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = true
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
}