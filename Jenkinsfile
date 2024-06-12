pipeline {
    agent any

    environment {
        // Define environment variables here
        DOCKER_IMAGE = 'mywebapp:latest'
        REGISTRY = 'your-docker-registry-url'
        CREDENTIALS_ID = 'docker-registry-credentials'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from Git
                git url: 'https://github.com/your-username/your-repo.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                // Build Docker image
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        stage('Test') {
            steps {
                // Run unit tests
                sh 'npm install'
                sh 'npm test'
            }
        }
        stage('Push to Registry') {
            steps {
                // Push Docker image to registry
                script {
                    docker.withRegistry(REGISTRY, CREDENTIALS_ID) {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                // Deploy application (e.g., using SSH to remote server or using a deployment tool)
                // This can be customized based on your deployment strategy
                sh 'ssh user@remote-server "docker pull $REGISTRY/$DOCKER_IMAGE && docker run -d -p 80:3000 $REGISTRY/$DOCKER_IMAGE"'
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
