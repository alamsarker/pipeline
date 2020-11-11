pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'chmod +x jenkins/*'
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
          echo "Git Branch: "${env.GIT_BRANCH}"

          if( "${ENV_SERVER}" != "skip" ) {
            if( "${ENV_SERVER}" == "master" && "${env.GIT_BRANCH}" != "master" ) {
              echo 'Skipped deploy. Prod deploy requires master branch'
            } else {
              sh "jenkins/deploy.sh ${ENV_SERVER}"            
              //sh "bash -c \" source jenkins/deploy.sh ${ENV_SERVER}\"" 
            }
          } else {
            echo 'Skipped deploy.'
          }
        }
      }
    }
  }

  environment {
    BUILD_TAG = "${env.BUILD_TAG}"
  }  
}
