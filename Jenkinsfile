pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'chmod +x jenkins/*'
        sh 'jenkins/build.sh'
      }
    }

  }
}