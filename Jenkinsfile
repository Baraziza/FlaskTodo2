pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_FILE = 'docker-compose.yml'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub with credentials
                git branch: 'main', credentialsId: 'adbf97de-20ac-4884-8212-24eb6c1094fe', url: 'https://github.com/Baraziza/FlaskTodo2.git'
            }
        }

        stage('Build and Test') {
            steps {
                script {
                    // Build Docker containers
                    sh "docker-compose -f ${env.DOCKER_COMPOSE_FILE} build"
                    
                    // Start Docker containers in detached mode
                    sh "docker-compose -f ${env.DOCKER_COMPOSE_FILE} up -d"
                    
                    // Run tests (adjust command according to your testing setup)
                    sh "docker-compose -f ${env.DOCKER_COMPOSE_FILE} run --rm app pytest"
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // Add your deployment steps here
                // Example: sh "scripts/deploy.sh"
            }
        }
    }

    post {
        always {
            // Clean up Docker containers and networks
            script {
                sh "docker-compose -f ${env.DOCKER_COMPOSE_FILE} down"
            }
        }
    }
}

