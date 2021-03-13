# How did I proceed?
[click here](how-did-i-proceed.md)

# How to use

## Preparation
To execute terraform you need to create a service account key first. (See: https://cloud.google.com/docs/authentication/getting-started )

Download the key as json file and store it in the project directory. 

Open terraform.tfvars and overwrite the variables. Set value of `credentials_file` to the downloaded filename and set `project` variable. 

## Run terraform

Running terraform without any parameters creates a instance with default values as described in `variables.tf`.

    terraform apply

Pass a variable file on the commandline and create a vm with a specific configuration. Values in custom tfvars files overwrites defaults in `terraform.tvfars`

---
Hint: To prevent destroying previously created resources, create a new workspace for each customer

---

    terraform workspace new customerA
    terraform apply -var-file=customer-configs/customerA.tfvars

or

    terraform workspace new customerB
    terraform apply -var-file=customer-configs/customerB.tfvars

or 

    terraform workspace new customerC
    terraform apply -var-file=customer-configs/customerC.tfvars 




Switch between already created workspaces:

    terraform workspace select CustomerB

Show all workspaces

    terraform workspace list



# Files
`backend.tf`

Configuration of google provider. Retrieves some default settings from terraform.tfvars.

`main.tf`

Creates a virtual machine in GCP and binds vm to a network interface (without external ip).

`network.tf`

Creates two vpc networks and assigns vpc peering between them.

`variables.tf`

Provides a list of used variables, partially with default values. 

`terraform.tfvars`

Predefined values for those variables, that are not predefined in `variables.tf`.

'terraform apply' command automatically loads this file, if exists. 

There are further variable files containing configurations for different customer vms

- `customerA.tfvars`
- `customerB.tfvars`
- `customerC.tfvars`
