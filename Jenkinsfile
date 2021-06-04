pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'sudo cp index.html /var/www/html'
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
