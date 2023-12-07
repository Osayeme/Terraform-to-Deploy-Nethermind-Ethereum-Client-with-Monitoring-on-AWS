# Terraform to Deploy Nethermind Ethereum Client with Monitoring Stack

This is me exploring the deployment of Nethermind's Ethereum Client with the Grafana monitoring tool.

The content of this repo was created following the guide from [NethermindEth](https://old.docs.nethermind.io/nethermind/guides-and-helpers/deploy-nethermind-with-monitoring-stack)

## Deployment Notes
### Setting up
First of all let us download repository with necessary files:
  git clone https://github.com/Osayeme/Terraform-to-Deploy-Nethermind-Ethereum-Client-with-Monitoring-on-AWS

Let's move to the cloned directory
 `cd terraform-nethermind/`

Login to your AWS account and create and create a key pair with the name "nethermind" Ensure to use the .pem format
<img width="947" height="400" alt="neth terra apply timing out process held" src="https://github.com/Osayeme/Terraform-to-Deploy-Nethermind-Ethereum-Client-with-Monitoring-on-AWS/blob/main/assets/Create%20key%20pair.png">

In your main.tf file, ensure that you are referencing a valid VPC security group ID and that your private key is properly referenced
<img width="947" height="400" alt="neth terra apply timing out process held" src="https://github.com/Osayeme/Terraform-to-Deploy-Nethermind-Ethereum-Client-with-Monitoring-on-AWS/blob/main/assets/security%20group.png">

### Running the stack
Confirm that terraform can be initialized, run this command from within terraform-nethermind directory
`terraform init`
<img width="947" height="400" alt="initialization message" src="https://github.com/Osayeme/Terraform-to-Deploy-Nethermind-Ethereum-Client-with-Monitoring-on-AWS/blob/main/assets/initialized.png">


Let's preview our plan before applying and save it so that it can be used in a future
`terraform plan -out myplan`

Provide some basic configuration to your Virtual Machine and Nethermind Node
<img width="947" height="400" alt="Configuration" src="https://github.com/Osayeme/Terraform-to-Deploy-Nethermind-Ethereum-Client-with-Monitoring-on-AWS/blob/main/assets/config.png">

Let's apply our plan and start deploying whole stack (it should take no longer than 3 minutes)

`terraform apply myplan`

Wait until terraform is done deploying and if everything went smooth you should see
<img width="947" height="200" alt="Apply complete" src="https://github.com/Osayeme/Terraform-to-Deploy-Nethermind-Ethereum-Client-with-Monitoring-on-AWS/blob/main/assets/applycomplete.png">

