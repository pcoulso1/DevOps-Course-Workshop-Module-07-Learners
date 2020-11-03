pipeline {
    agent any

    options {
        skipDefaultCheckout true
        disableConcurrentBuilds()
    }

    environment {
        TEST_ENV = "Test environment variable"
        HOME = ${WORKSPACE}
    }

    stages {
        stage('Checkout') {
            steps{
                checkout scm
            }
        }
    

        stage('Parallel Stage') {
            failFast true
            parallel {
                stage('DotNet') {
                    agent {
                        docker {
                            image "mcr.microsoft.com/dotnet/core/sdk:3.1"
                            reuseNode true
                        }
                    }
                    stages {
                        stage('DotNet Build') {
                            steps {
                                sh """
                                set -ex
                                dotnet build
                                """
                            }
                        }
                        stage('DotNet test') {
                            steps {
                                sh """
                                set -ex
                                dotnet test
                                """
                            }
                        }
                    }
                }

                stage('Node') {
                    agent {
                        docker {
                            image "node:14-alpine"
                            reuseNode true
                        }
                    }
                    stages {
                        stage('Node Install') {
                            steps{
                                sh """
                                set -ex
                                cd DotnetTemplate.Web
                                npm install
                                """
                            }
                        }
                        stage('Node build') {
                            steps{
                                sh """
                                set -ex
                                cd DotnetTemplate.Web
                                npm run build
                                """
                            }
                        }
                        stage('Node lint') {
                            steps{
                                sh """
                                set -ex
                                cd DotnetTemplate.Web
                                npm run lint
                                """
                            }
                        }
                        stage('Node test') {
                            steps{
                                sh """
                                set -ex
                                cd DotnetTemplate.Web
                                npm t
                                """
                            }
                        }
                    }
                }
            }
        }
    }
}