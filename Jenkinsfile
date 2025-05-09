pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                echo 'Hello'
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
