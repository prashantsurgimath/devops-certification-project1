pipeline {
  agent any
  tools {
    maven 'M2_HOME'
  }
  stages {
    stage ('GetCode from SCM'){
      steps{
         git 'https://github.com/prashantsuragimath/devops-certification-project1.git'
      }
    }
    stage ("terraform init") {
      steps{
         sh ('terraform init -reconfigure') 
      }
    }
    stage ("terraform plan") {
      steps{
         sh ('terraform plan') 
      }
    }            
    stage ("terraform apply") {
      steps{
         echo "Terraform action"
         sh ('terraform apply --auto-approve')
      }
    }
    stage ('Build the package'){
      steps{
         sh 'mvn clean package'
      }
    }
   stage('Docker Build') {
            steps {
                sh 'docker build -t pkcsmath/project1 .'
            }
        }
   stage('Docker Push') {
            steps { 
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
                sh 'docker login -u pkcsmath -p Prashant@1989'
                  }
                sh 'docker push pkcsmath/project1'
                  }                                     
             }
    stage(" Deploying app onto Test_server using Ansible") {
        steps {
            ansiblePlaybook credentialsId: 'Ansible-deploy', disableHostKeyChecking: true, installation: 'Ansible', inventory: 'stage.inv', playbook: 'Docker-deploy-1.yml'
        }    
    }
    stage(" Deploying app onto Prod_server using Ansible") {
        steps {
            ansiblePlaybook credentialsId: 'Ansible-deploy', disableHostKeyChecking: true, installation: 'Ansible', inventory: 'prod.inv', playbook: 'Docker-deploy-2.yml'
        }    
    }
    stage(" Email-Notify"){
        steps {
            emailext attachLog: true, body: '''Hello,
            Check your build status and build logs.
            Thankyou.''', recipientProviders: [developers()], subject: 'Build Success or Failure?', to: 'pkcsmath@gmail.com'
        }
    }
  }
}
