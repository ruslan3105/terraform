provider "aws" {
    access_key = 
    secret_key = 
    region = "eu-central-1"
}
variable "ingressrules"{
    type = list(number)
    default = [80,443]
}
variable "egressrules"{
    type = list(number)
    default = [80,443]
}

resource "aws_instance" "my_linux" {
    ami = "ami-030e490c34394591b"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]

    tags = {
        Name = "My trainning instance"
    }
}

resource "aws_security_group" "webtraffic" {

    name = "Allow traffic"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }
        
    dynamic "egress" {
        iterator = port
        for_each = var.egressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }
    }  
