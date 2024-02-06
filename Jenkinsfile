pipeline {
    agent any

    environment {
        TF_HOME = tool 'terraform-1.7.2-linux'
        // AWS_PROFILE="personal"
    }

    stages {
        stage('clean workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/amjedsaleel/aws-ec2-autoscaling-terraform.git'
            }
        }

       stage('Terraform init') {
            steps {
                withAWS(credentials: 'aws-personal', region: 'ap-south-1') {
                    sh '${TF_HOME}/terraform init -no-color'
                }
            }
        }

       stage('Terraform validate') {
            steps {
                sh '${TF_HOME}/terraform validate -no-color'
            }
        } 

       stage('Terraform apply') {
            when {
                branch 'main'
            }
            steps {
                sh '${TF_HOME}/terraform apply -auto-approve -no-color'
            }
        } 
    }
}
