provider "aws" {
    access_key = "AKIASBK2Z7EQY6NWPLHM"
    secret_key = "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"
    region = "eu-central-1"
}


resource "aws_instance" "my_linux" {
    ami = "ami-030e490c34394591b"
    instance_type = "t2.micro"
}
