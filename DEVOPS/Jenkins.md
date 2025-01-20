# CI - intigrate the code, static code analasis, package the application , archive the artifacts is part of contineous intigration ?
# CD : [delivery] : with the manual intervention to the process after ci is called contineous delivery like we need leagal approvals, permiision for time etc like
# CD : [deployment] : is completly automated no manual intervention , ideal for microservices 

pipelines:

scripted pipeline, decleraive pipeline

declerive pipeline


@Library('my_library')_
pipeline {
    agent any
    parameters{
        choice( name:'env' , choices:[dev,test,stage,prod], description:choose branch)
    }
    stages{
        stage('git checkout'){
            steps{
             git branch 'main', url 'git.com' credentialsId 'credits'
            }
        }
    
        stage('build'){
            steps{
               script{
                try{'sh mvn clean package'}
                catch('execption -e){
                     'error: git checkout failed'
                }
               } 
            }
        }
    }

}


==========================================


# manage jenkins > plugins > thin backup > role based authorisation[matrix based users provision] :: plugins  

# Thin_bakcup:: for taking backup of jobs, pipelines, user account details build history[console outputs], build configuratons are taken apart from this they provide retention polocy like these files autometiclly wiped up at some certaain point of time, as per cron job performed regular backup

# tools configuration git,sonar,azure cli, aws cli, trivy, jdks etc

# Backup of artifacts, docker images to remote and wipe the data in server mountpoint to give best performanace, contineously deleted artifacts and images

# shared library for storing templetes of pipeline stages like , repeatedly used stages will be stored in the librery , used groovy scripting for writing stages

# worker node[agent] configurations to facilitate dostribute work on masternode

# impliment manual gate approval gate to deploy to production  ||  input message: 'Approve Deployment to Production?', ok: 'Deploy'