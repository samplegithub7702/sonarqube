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
        stage('Code Coverage') {
            steps {
                sh "mvn jacoco:prepare-agent test jacoco:report"
            }
        }
        stage('SonarQube analysis') {
            steps {
                sh "echo 'Running SonarQube analysis'"
                sh "mvn sonar:sonar " +
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

