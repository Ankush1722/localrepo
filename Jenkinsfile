pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-repo')
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Ankush1722/localrepo.git', branch: 'main'
            }
        }
        stage('Build & Login') {
            steps {
                script {
                    // Build & Login to Docker Hub
                    sh 'docker build -t ankushdeep653/my-app:node-1.0 .'
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
                    }
                }
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }       
        stage('Push to Registry') {
            steps {
                script {
                    // Push Docker image to registry
                    sh 'docker push ankushdeep653/my-app:node-1.0'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Deploy application
                    sh 'docker system prune -af'
                    sh 'docker pull ankushdeep653/my-app:node-1.0'
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
