pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh """
                    sudo apt update
                    sudo apt install nginx
                    sudo systemctl status nginx
                """
            }
        }
        stage('Test') {
            steps {
                echo 'Testing from master..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying from master..'
            }
        }
    }
}
