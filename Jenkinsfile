pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        //sh 'docker build -t php-composer:1.0 jenkins'
        sh 'chmod +x jenkins/*'
        //sh 'jenkins/build.sh'
      }
    }

    stage('Test') {
      steps {
        echo 'Testing'
      }
    }

    stage('Deploy') {
      steps {
        input(message: 'Which Server?', ok: 'Yes', parameters: [ 'Text' ])
        echo 'Deploing...'
        //sh 'jenkins/deploy.sh'
      }
    }
  }
}
