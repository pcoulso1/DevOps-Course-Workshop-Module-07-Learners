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
    }
}