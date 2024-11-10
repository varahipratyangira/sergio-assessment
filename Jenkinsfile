pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = '/path/to/your/gcp-credentials-file.json'  // GCP credentials path
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub
                git 'https://github.com/varahipratyangira/gcp-terraform-ansible-deployment.git'
            }
        }

        stage('Initialize Terraform') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }

        stage('Validate Terraform') {
            steps {
                // Validate Terraform configuration
                sh 'terraform validate'
            }
        }

        stage('Plan Terraform') {
            steps {
                // Generate Terraform plan with the variable file
                sh 'terraform plan -var-file=terraform.tfvars'
            }
        }

        stage('Apply Terraform') {
            steps {
                // Apply Terraform changes automatically
                sh 'terraform apply -auto-approve -var-file=terraform.tfvars'
            }
        }
    }

    post {
        success {
            echo 'Terraform Apply completed successfully'
        }
        failure {
            echo 'Terraform Apply failed'
        }
    }
}
