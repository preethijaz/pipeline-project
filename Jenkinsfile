pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh """
                    apt update
                    apt install nginx
                    systemctl status nginx
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
