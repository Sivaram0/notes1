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
terrafrom console

# write terraform file for ec2, vm, s3, blob_storage
# terrafrom functions 
# terraform life cycle
# state file managemenet to upload in S3,blob storage
# terraform tests , unit testing 
# failure handling provisoning 
# $ENV: TF_LOG='info','debug','error','trace','warn'
# tfcheckov for infra scaning