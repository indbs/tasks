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

resource "aws_instance" "buildMachine" {
  ami           = "ami-08962a4068733a2b6"
  instance_type = "t2.micro"

  key_name = "aws3"
  security_groups = ["groupAnsible11"]
#  user_data = "${file("post_provide.sh")}"

  tags = {
    Name = "buildMachine"
  }

  provisioner "local-exec" {
    command = "rm -f /home/final_task/build_machine_ip.info && echo ${self.public_ip} >> /home/final_task/build_machine_ip.info && echo buildMachine ip is ${self.public_ip}"
  }

}

resource "aws_instance" "stageMachine" {
  ami           = "ami-08962a4068733a2b6"
  instance_type = "t2.micro"

  key_name = "aws3"
  security_groups = ["groupAnsible11"]

  tags = {
    Name = "stageMachine"
  }

  provisioner "local-exec" {
    command = "rm -f /home/final_task/stage_machine_ip.info && echo ${self.public_ip} >> /home/final_task/stage_machine_ip.info && echo stageMachine ip is ${self.public_ip}"
  }

}
