pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            echo 'Building'
          }
        }

        stage('build-1') {
          steps {
            sh 'jenkins/build.sh'
          }
        }

      }
    }

  }
}