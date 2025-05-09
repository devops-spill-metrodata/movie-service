pipeline {
    agent any

    tools{
        maven 'Maven 3.9.5'
        jdk 'JDK 17'
    }

    stages {
        stage('Build and Test') {
            steps {
                sh './mvnw clean package'
            }
        }
    }

    post{
        always{
            echo "This for always notify"
        }
        success{
            echo "Nofify Success"
        }
        failure{
            echo "Nofify Failure"
        }
    }
}
