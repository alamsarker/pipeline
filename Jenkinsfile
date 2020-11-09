pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t php-composer:1.0 jenkins'
        sh 'docker run --name php-composer-container -d php-composer:1.0'
        sh 'docker ps'
        sh 'chmod +x jenkins/*'
        sh 'jenkins/build.sh'
      }
    }

  }
}