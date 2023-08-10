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
        stage('SonarQube analysis') {
            steps {
                sh "echo 'Running SonarQube analysis'"
                sh "mvn clean verify sonar:sonar " +
                   "-Dsonar.projectKey=sonarqubbe " +
                   "-Dsonar.host.url=http://54.67.125.210:9000 " +
                   "-Dsonar.login=sqp_99fea77fcb35ba7cf4f7c418e2945c37852620d0"
                sh "echo 'SonarQube analysis complete'"
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

