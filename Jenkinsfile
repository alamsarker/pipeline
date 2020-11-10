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
            script {
            // Define Variable
             def USER_INPUT = input(
                    message: 'User input required - Which Server?',
                    parameters: [
                        [
                          $class: 'ChoiceParameterDefinition',
                          choices: ['Develop', 'Release', 'Live'].join('\n'),                        
                          name: 'input',                          
                          description: 'Where will be deployed'
                        ]
                    ])

            echo "The answer is: ${USER_INPUT}"

            if( "${USER_INPUT}" == "Develop"){
                echo 'DELPOLYING ..'
            } else {
                echo 'ELSE DELPOLYING ..'
            }
        }
        echo 'Deploing...'
        //echo "Branch Name: $(BRANCH_NAME) - $BRANCH_NAME"
        echo "Branch Name: ${env.GIT_BRANCH}"
        sh 'printenv'
        //sh 'jenkins/deploy.sh'
      }
    }
  }
}
