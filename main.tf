terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "nethermind-client" {
  ami           = "ami-0b0ea68c435eb488d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0ab2b4aa95725a78e"]
  key_name = "nethermind"

  connection {
    user        = "ubuntu"
    type        = "ssh"
    private_key = file("/nethermind.pem")
    host        = self.public_ip
  }

  provisioner "file" {
  source      = "docker-compose.yml"
  destination = "/home/ubuntu/docker-compose.yml"
  connection {
    type    = "ssh"
    user    = "ubuntu" # Replace with your SSH user
  }
 }

  provisioner "file" {
    source      = "./NLog.config"
    destination = "/home/ubuntu/NLog.config"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /home/ubuntu/docker-compose.yml /root/docker-compose.yml",
      "sudo mv /home/ubuntu/NLog.config /root/NLog.config",	
      "sudo apt-get update",
      "sudo apt-get install -y docker docker-compose",
      "git clone https://github.com/NethermindEth/metrics-infrastructure.git",
      "cp -r metrics-infrastructure/grafana metrics-infrastructure/prometheus .",
      "export HOST=$(curl ifconfig.me)",
      "export NAME=\"Nethermind node on ${var.config}\"",
      "sudo sed -i '10s/.*/            - NETHERMIND_CONFIG=${var.config}/' /root/docker-compose.yml",
      "sudo sed -i '11s/.*/            - NETHERMIND_JSONRPCCONFIG_ENABLED=${var.rpc_enabled}/' /root/docker-compose.yml",
      "sudo sed -i '36s/.*/            <target xsi:type=\"Seq\" serverUrl=\"'\"http:\\/\\/$HOST:5341\"'\" apiKey=\"Test\">/' /root/NLog.config",
      "sudo docker-compose -f /root/docker-compose.yml up -d"
    ]
  }
}