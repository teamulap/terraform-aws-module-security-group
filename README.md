# AWS Security Group Terraform Module

[![CircleCI](https://circleci.com/gh/teamulap/terraform-aws-module-security-group.svg?style=svg&circle-token=8814ec75542494ffcd79900ac9a0b303611a28c2)](https://circleci.com/gh/teamulap/terraform-aws-module-security-group)


This module creates a ready-to-use AWS Security Group.

## Change Log
**v0.0.1**
- Security Group Created will have:
- 1 Security Group 
- Dynamic Security Group Rules

## Future plans
1. Review and use the module to reveal other use-cases

## Usage
```hcl
module "sg" {
    source  = "../../../terraform/modules"
    region  = "ap-northeast-1"
    vpc_id  = "vpc-a7e458c0"
    sg_name = "Terratest-SG-1"
    sg_description  = "A Temporary Security Group"
    sg_tags         = {
                        Name = "Terratest-SG-1"
                        Project = "Terratest"
                        Environment = "development"
                        Contact  = "jcbagtas"
                        Temporary = "true"
                        CostCenter = "JC"
                        Terraform = "true"
                        ManagedBy = "jcbagtas"
                    }
    sg_rules = [
        {
            type        = "ingress"
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks = ["120.29.75.172/32"]
        },
        {
            type        = "ingress"
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        },
    ]
}
```
