pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker-compose version'
        sh 'chmod +x jenkins/*'
        sh 'jenkins/build.sh'
      }
    }

  }
}