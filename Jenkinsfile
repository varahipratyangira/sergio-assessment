pipeline {
    agent any

    environment {
        GCP_PROJECT = 'trusty-wavelet-441019-i7'
        GCP_CREDENTIALS = '/home/arikatlasrinivasulu/trusty-wavelet-441019-i7-c780b14f875a.json'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/varahipratyangira/sergio.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Apply') {
            steps {
                withCredentials([file(credentialsId: 'gcp-credentials', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
