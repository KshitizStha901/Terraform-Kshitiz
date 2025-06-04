pipeline {
    agent any

    stages {
        stage('Init Terraform') {
            steps {
                dir('TF-EC2') {
                    sh 'terraform init'
                }
                dir('TF-S3') {
                    sh 'terraform init'
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
    }
}

