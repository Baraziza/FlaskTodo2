pipeline {
    agent any
    
    environment {
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                git credentialsId: 'c33153cb-2d7a-435e-a0f4-a31142f215e3', url: 'https://github.com/Baraziza/FlaskTodo2'
            }
        }

        stage('Build and Test') {
            steps {
                // Build and test Docker containers
                script {
                    dockerCompose('-f ${env.DOCKER_COMPOSE_FILE} build')
                    dockerCompose('-f ${env.DOCKER_COMPOSE_FILE} up -d')
                    // Add additional commands for testing here
                }
            }
        }

        stage('Deploy') {
            steps {
                // Add your deployment steps here, if any
                echo 'Deploying...'
            }
        }
    }

    post {
        always {
            // Clean up Docker containers after the build
            script {
                dockerCompose('-f ${env.DOCKER_COMPOSE_FILE} down')
            }
        }
    }
}
