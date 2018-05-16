#!groovy

pipeline {
  environment {
     REGHOST="myregistry.democompany.com:5000"
     BUILD_HOME="/var/lib/jenkins/workspace"
  }
  agent none
  stages {
    stage('Pipeline Started') {
      steps {
        echo "Received webhook from Git" 
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh "docker image build -t ${REGHOST}/super-app ."
        sh "docker image tag ${REGHOST}/super-app:latest ${REGHOST}/super-app:1.${BUILD_NUMBER}"
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withRegistry('http://myregistry.democompany.com:5000', 'RegistryLogin'){
          def newImage = docker.build("super-app:1${env.BUILD_ID}")
          newImage.push()
        }
      }
    }
  }
}
