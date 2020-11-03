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
                sh """
                set -ex
                export HOME=${env.WORKSPACE}
                dotnet build
                dotnet test
                """
            }
        }

        stage('Node Build') {
            agent {
                docker {
                    image "node:14-alpine"
                    reuseNode true
                }
            }
            steps{
                sh """
                set -ex
                export HOME=${env.WORKSPACE}
                cd DotnetTemplate.Web
                npm install
                npm run build
                npm run lint
                npm t
                """
            }
        }
    }
}