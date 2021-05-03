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
  tags = {
    Name = "buildMachine"
  }
  //moving aws creds
  provisioner "file" {
    connection {
      type          = "ssh"
      user          = "ubuntu"
      private_key   = "${file(var.pvt_key)}"
      timeout       = "1m"
      agent         = false
      host          = self.public_ip
    }
    source      = "~/.aws/"
    destination = "/tmp"
  }
  //remote exec
  provisioner "remote-exec" {
    connection {
      type          = "ssh"
      user          = "ubuntu"
      private_key   = "${file(var.pvt_key)}"
      timeout       = "1m"
      agent         = false
      host          = self.public_ip
    }
    inline = [
      "rm ~/.aws",
      "mkdir -p ~/.aws/",
      "cp -Rv /tmp/.aws/* ~/.aws/",
      "sudo apt update && sudo apt install git -y",
      "sudo apt update && sudo apt install maven -y",
      "sudo apt update && sudo apt install default-jdk -y",
      "sudo apt update && sudo apt install awscli -y",
      "git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && cd boxfuse-sample-java-war-hello && mvn package && cd target && aws s3 cp hello-1.0.war s3://mybacket13.test1313.com",
    ]
  }
}

resource "aws_instance" "prodMachine" {
  ami           = "ami-08962a4068733a2b6"
  instance_type = "t2.micro"

  key_name = "aws3"
  security_groups = ["groupAnsible11"]
  tags = {
    Name = "prodMachine"
  }
  //remote exec
  provisioner "remote-exec" {
    connection {
      type          = "ssh"
      user          = "ubuntu"
      private_key   = "${file(var.pvt_key)}"
      timeout       = "1m"
      agent         = false
      host          = self.public_ip
    }
    inline = [
      "rm ~/.aws",
      "mkdir -p ~/.aws/",
      "cp -Rv /tmp/.aws/* ~/.aws/",
      "sudo apt update && sudo apt install tomcat9 -y",
      "sudo apt update && sudo apt install awscli -y",
      "aws s3 sync s3://mybacket13.test1313.com /var/lib/tomcat9/webapps",
    ]
  }
}
