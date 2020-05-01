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
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["120.29.75.172/32"]
        },
        {
            type        = "ingress"
            from_port   = 443
            to_port     = 443
            protocol    = "tcp"
            cidr_blocks = ["120.29.75.172/32"]
        },
        {
            type        = "ingress"
            from_port   = 943
            to_port     = 943
            protocol    = "tcp"
            cidr_blocks = ["120.29.75.172/32"]
        },
        {
            type        = "egress"
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
}