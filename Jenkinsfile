pipeline {
    agent any

    environment {
        GOOGLE_CREDENTIALS = credentials('google-cloud-service-account')
        TF_VAR_project_id = 'trusty-wavelet-441019-i7'
        TF_VAR_region = 'us-west1'
        TF_VAR_location = 'US'
        TF_VAR_website_bucket_name = 'rga-sergio-assessment-bucket'
        TF_VAR_access_logs_bucket_name = 'rga-sergio-assessment-access-logs'
        TF_VAR_gcp_credentials_file = '/home/arikatlasrinivasulu/trusty-wavelet-441019-i7-c780b14f875a.json'
        TF_VAR_github_index_html_url = 'https://github.com/varahipratyangira/static-html-webpage/raw/main/index.html'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply tfplan'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
