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
                   "-Dsonar.projectKey=sonarqube " +
                   "-Dsonar.host.url=http://52.8.96.200:9000/ " +
                   "-Dsonar.login=sqp_cb3ce7c5ba4be063b9b8adf52c2996e364a62071"
                sh "echo 'SonarQube analysis complete'"
            }
        }
        stage('Quality Gate Check') {
            steps {
                script {
                    def qualityGateStatus = sh(script: 'curl -s -u sqp_99fea77fcb35ba7cf4f7c418e2945c37852620d0: -X GET "http://54.67.125.210:9000/api/qualitygates/project_status?projectKey=sonarqubbe"', returnStdout: true).trim()
                    echo "Quality Gate Status: $qualityGateStatus"
                    if (qualityGateStatus.contains('ERROR') || qualityGateStatus.contains('WARN')) {
                        currentBuild.result = 'FAILURE'
                        error("Quality Gate not met")
                    }
                }
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

