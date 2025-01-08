# Terraform Commands
terraform init
terraform fmt 
terraform validate 
terraform plan
terraform lint
terraform refresh
terraform providers
terraform apply
terraform apply --auto-approve
terraform apply --parallesim=5
terrafrom apply -var-file='infra.tfvars'
terrafrom destroy
terraform state show
terraform state list
terrafrom state mv
terraform import
terraform datasource
terrafrom taint <resource_name>
terraform untaint <resource_name>
terraform workspace show
terrafrom workspace list
terraform workspace select <name_of_env>
terrafrom workspace new <name_of_env>
terraform output -JSON
terrafrom show