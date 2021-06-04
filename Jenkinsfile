pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh """
                    cp index.html /var/www/html
                """
            }
        }
        stage('Test') {
            steps {
                echo 'Testing from master'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying from master'
            }
        }
    }
}
