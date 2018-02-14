#!groovy

pipeline {
  agent { label 'ubuntu' }
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3-alpine'
          label 'ubuntu'
        }
      }
      steps {
        sh 'mvn clean install'
      }
    } 
  }
}
