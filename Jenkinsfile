pipeline {
    agent any

    options {
        skipDefaultCheckout true
        disableConcurrentBuilds()
    }

    environment {
        TEST_ENV = "Test environment variable"
    }

    stages {
        stage('Checkout') {
            steps{
                checkout scm
            }
        }

        stage('DotNet Build') {
            agent {
                docker {
                    image "mcr.microsoft.com/dotnet/core/sdk:3.1"
                    reuseNode true
                }
            }
            steps{
                sh "dotnet build"
            }
        }
    }
}