variable "region" {
  type = string
  description = "(Required) Region of the Security Group"
}

variable "sg_name" {
  type = string
  description = "(Optional, Forces new resource) The name of the security group. If omitted, Terraform will assign a random, unique name"
}
variable "sg_description" {
  type = string
  description = "(Optional, Forces new resource) The security group description. Defaults to 'Managed by Terraform'. Cannot be ''. NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags."
}
variable "sg_tags" {
  type = map
  description = "(Required) A map of tags to assign to the resource."
}
variable "sg_rules" {
  type = list
  description  = "(Required) List of Security Group Rules. Represents a single ingress or egress group rule, which can be added to external Security Groups."
}
variable "vpc_id" {
  type = string
  description = "(Required) VPC ID where the Security Group should be spawned."
}
