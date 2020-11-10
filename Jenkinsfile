pipeline {
  agent any
  
  environment {
    BUILD_TAG = "${env.BUILD_TAG}"
  }
  
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
            script {
              def ENV_SERVER = input(
                message: 'User input required - Which Server?',
                parameters: [
                    [
                      $class: 'ChoiceParameterDefinition',
                      choices: ['develop', 'release', 'prod', 'skip'].join('\n'),
                      name: 'input',
                      description: 'Where will be deployed'
                    ]
                ]
              )

            echo "The answer is: ${ENV_SERVER}"

            if( "${ENV_SERVER}" != "skip"){       
                sh 'jenkins/deploy.sh'
            }
        }      
        //sh 'printenv'
      }
    }
  }
}
