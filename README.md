# Terraform to Deploy Nethermind Ethereum Client with Monitoring Stack

This is me exploring the deployment of Nethermind's Ethereum Client with the Grafana monitoring tool.

The content of this repo was created following the guide from [NethermindEth](https://docs.nethermind.io/nethermind/guides-and-helpers/deploy-nethermind-with-monitoring-stack)

## Deployment Notes
### Setting up
First of all let us download repository with necessary files:
  git clone https://github.com/Osayeme/Terraform-to-Deploy-Nethermind-Ethereum-Client-with-Monitoring-on-AWS

Let's move to the cloned directory
  cd terraform-nethermind/

Login to your AWS account and create and create a key pair with the name "nethermind" Ensure to use the .pem format
<img width="947" height="400" alt="neth terra apply timing out process held" src="https://github.com/Osayeme/Terraform-to-Deploy-Nethermind-Ethereum-Client-with-Monitoring-on-AWS/blob/main/assets/Create%20key%20pair.png">

In your main.tf file, ensure that you are referencing a valid VPC security group ID and that your private key is properly referenced
<img width="947" height="400" alt="neth terra apply timing out process held" src="https://github.com/Osayeme/Terraform-to-Deploy-Nethermind-Ethereum-Client-with-Monitoring-on-AWS/blob/main/assets/security%20group.png">
