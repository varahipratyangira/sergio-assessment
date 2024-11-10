pipeline {
    agent any
    environment {
        GCP_CREDENTIALS = credentials('gcp-credentials') // Use Jenkins credentials ID for GCP service account
        TERRAFORM_DIR = './project-directory' // Adjust the directory path if necessary
        GOOGLE_APPLICATION_CREDENTIALS = "${GCP_CREDENTIALS}" // Set for Terraform's GCP auth
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/varahipratyangira/sergio.git'
            }
        }
        stage('Fetch HTML from GitHub') {
            steps {
                sh 'curl -L -o index.html ${GITHUB_INDEX_HTML_URL}'
            }
        }
        stage('Setup Terraform') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
    post {
        always {
            cleanWs() // Clean workspace after build to avoid clutter
        }
    }
}
