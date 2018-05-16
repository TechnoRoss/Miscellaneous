#!groovy

pipeline {
  environment {
     REGHOST="myregistry.democompany.com:5000"
     BUILD_HOME="/var/lib/jenkins/workspace"
     BUILD_NUM=currentBuild.number
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
        sh 'docker image image tag ${REGHOST}/super-app:1.${BUILD_NUM}'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'RegistryLogin', passwordVariable: 'RegistryLoginPassword', usernameVariable: 'RegistryLoginUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker image push ${REGHOST}/super-app:1.${BUILD_NUM}"
        }
      }
    }
  }
}
