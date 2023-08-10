pipeline {
    agent any
    stages {
        stage('Compile and Clean') {
            steps {
                sh "mvn clean compile"
            }
        }
        stage('Build') {
            steps {
                sh "mvn package"
            }
        }
        stage('Test') {
            steps {
                sh "mvn test"
            }
        }
        stage('Unit Test') {
            steps {
                sh "echo 'Performing unit tests'"
                // Add your unit test command(s) here
                sh "echo 'Unit tests complete'"
            }
        }
        stage('Delivery') {
            steps {
                sh "echo 'Performing delivery'"
                sh "echo 'Delivery complete'"
            }
        }
        stage('Deploy') {
            steps {
                sh "echo 'Performing deployment'"
                sh "echo 'Deployment complete'"
            }
        }
    }
}
