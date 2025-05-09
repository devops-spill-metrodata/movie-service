pipeline {
    agent any

    tools{
        maven 'Maven 3.9.5'
        jdk 'JDK 17'
    }

    environment{
        REPO_URI = "975050033181.dkr.ecr.ap-northeast-1.amazonaws.com/johan-movie-service"
        REPO_REGISTRY_URL = "https://975050033181.dkr.ecr.ap-northeast-1.amazonaws.com"
        REGION = "ap-northeast-1"
    }

    stages {
        stage('Compile Application') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                sh """
                    docker build --platform=linux/amd64 -t ${REPO_URI}:latest .
                    docker tag ${REPO_URI}:latest
                """
            }
        }

        stage('Docker Push to ECR') {
            environment{
                ECR_REGISTRY_CREDENTIALS = 'ecr:ap-northeast-1:aws-credentials'
            }
            steps {
                docker.withRegistry("${REPO_REGISTRY_URL}", "${ECR_REGISTRY_CREDENTIALS}"){
                    sh "docker push ${REPO_URI}:latest"
                }
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
