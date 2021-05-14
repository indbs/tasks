terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.38.0"
    }
  }
}

variable "pvt_key" {
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "newCloudMachine" {
  ami           = "ami-08962a4068733a2b6"
  instance_type = "t2.micro"

  key_name = "aws3"
  security_groups = ["groupAnsible11"]
#  user_data = "${file("post_provide.sh")}"

  tags = {
    Name = "newCloudMachine"
  }

  provisioner "local-exec" {
    command = "rm -f /home/final_task/cloud_machine_ip.info && echo ${self.public_ip} >> /home/final_task/cloud_machine_ip.info && echo newCloudMachine ip is ${self.public_ip}"
  }

}
