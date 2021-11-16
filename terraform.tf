provider "aws" {
    access_key = "AKIASBK2Z7EQUC2XM3Q4"
    secret_key = "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"
    region = "eu-central-1"
}

resource "aws_instance" "my_linux" {
    ami = "ami-030e490c34394591b"
    instance_type = "t2.micro"
}