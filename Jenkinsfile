pipeline {
    agent any
    stages{    
        stage('Build & Login') {
            steps {
                // Build & Login to Docker Hub
                script {
                    sh 'docker build -t ankushdeep653/my-app:node-1.0 .'
                    sh "docker login -u ankushdeep653 -p panesarworld"
                }
            }
        }
        stage('Push to Registry') {
            steps {
                // Push Docker image to registry
                script {
                    sh 'docker push ankushdeep653/my-app:node-1.0'
                }
            }
        }
        stage('Deploy') {
            steps {
                // Deploy application (e.g., using SSH to remote server or using a deployment tool)
                // This can be customized based on your deployment strategy
                script{
                    sh 'docker pull akushdeep653/my-app:node-1.0'
                    sh 'docker run --name nodeapp -d -p 3000:3000 ankushdeep653/my-app:node-1.0'
                }

            }
        }
    }
    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
