GitHub::

git init
git clone 'http://repository.com'
git add . / git add <filename>
git commit -m "added changes"
git push 
git status
git stash <stash the changes and do work on imp task and unstash the changes>
git squash <multiple commits to a single commit for better commit flow history>
git log -- oneline
git history
git rebase <It reapplies the commits from your current branch (the branch you're on) on top of another branch's changes.
            This is done to update your branch with the latest changes from the target branch while maintaining a linear commit history.>
git pull <fetch latest code from remote repository and initgrate them in current repository>
git pull = <git fetch + git merge>
git reset --soft <Keeps all changes staged (in the index). || No changes are made to the working directory.>
git rest --mixed <>
git reset -hard <unstage the changes as well as discard the  changes in the working directory>
git branch
git checkout <branch_name>
git checkout -b <brnach_name>
.git > hooks [precommit, pre-push, pre-merge, post-update,] 
     > objects
     > logs

----------------------------------


Jenkins pipeline::

<!-- @Library(shared_library)_

parameters{
    choice ( name: env choices: ['dev','test','stage'] description: 'select env' )
}
pipeline{
    agent any
    stages{
        stage(){
            steps{
                try{
                 sh 'mvn clean install'
                }
                catch('expetion e'){
                         echo 'build failed '
                }
            }
        }
    }
}

if (parames.env = dev){
    echo 'deploy to env'
}
else-if(parameters.env = test){
} -->

thin_backup
role baseed authorisation


----------------------------------------


Terraform:

terraform init <initalises the terraform in directory> 
terraform validate <validate the code , checks the syntex, logical errors etc>
terraform fmt <format the code for best visualisation like better understandbility>
terrraform lint <same as fmt >
terraform refresh
terraform plan <gives cli output like what will be created after executing terraform apply , here  we can check infra before executing terraform apply>
terraform apply --auto -approve <with out asking anything it creates infra  >
terrafrom destory <delete the  infra>

terraform workspace show
terraform workspace list
terraform workspace select  <dev>  <switch to the different env>
terraform workspace new <name of env>
terraform apply -var="environment=dev" <for different environment>
terraform apply -var-file='infra.tfvars'
terraform apply --parallesim=5

state::

terraform state show  <Shows detailed information about a specific resource in the state.>
terraform state list <This will show a list of all resources that Terraform is currently managing in your state file.>
terraform state pull <Pulls the latest state from the remote backend and prints it.>
terraform state mv
terraform state push terraform.tfstate <Pushes a local state file to the remote backend.>
terraform state rm aws_instance.example <Removes a resource from the Terraform state without destroying it.>
terraform state mv aws_instance.old_name aws_instance.new_name <Moves a resource from one state to another (e.g., renaming or moving resources).>

terraform import aws_instance.example i-0abcdef1234567890 <if want to manage the external created resource with in the terraform we use the terraform import>
Data Sources:<When you want to retrieve information about existing resources or external systems that Terraform does not manage directly.>

terrafrom taint <resource_name>
terraform untaint <resource_name>


Ansible::

ansible all -m ping 
ansible -i inventory.ini -m ping all
ansible -i inventory.ini -m copy -a "src=tem/XXX dest=/tmp/hd/djhf"