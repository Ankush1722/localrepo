pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from Git
                git url: 'https://github.com/Ankush1722/localrepo.git', branch: 'main'
            }
        }
        stage('Build & Login') {
            steps {
                // Build & Login to Docker Hub
                script {
                    sh 'docker build -t ankushdeep653/my-app:node-1.0 .'
                    sh "docker login -u ankushdeep653 -p $PWD"
                }
            }
        }
//        stage('Test') {
//            steps {
                // Run unit tests
//                sh 'npm install'
 //               sh 'npm test'
//            }
//        }
        stage('Push to Registry') {
            steps {
                // Push Docker image to registry
                script {
                    sh 'docker push ankushdeep653/my-app:node-1.0'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                // Deploy application (e.g., using SSH to remote server or using a deployment tool)
                // This can be customized based on your deployment strategy
                sh 'docker pull akushdeep653/my-app:node-1.0'
                sh 'docker run --name nodeapp -d -p 3000:3000 ankushdeep653/my-app:node-1.0'
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
