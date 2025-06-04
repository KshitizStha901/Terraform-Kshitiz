pipeline {
    agent any

    stages {
        stage('Init Terraform') {
            steps {
                dir('TF-EC2') {
                    sh 'terraform init -input=false'
                }
                dir('TF-S3') {
                    sh 'terraform init -input=false'
                }
            }
        }

        stage('Validate Terraform') {
            steps {
                dir('TF-EC2') {
                    sh 'terraform validate'
                }
                dir('TF-S3') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('TF-EC2') {
                    sh 'terraform plan'
                }
                dir('TF-S3') {
                    sh 'terraform plan'
                }
            }
        }
    }
}
