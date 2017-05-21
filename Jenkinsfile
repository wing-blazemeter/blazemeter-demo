pipeline {

  agent any

  environment {
    BLAZEMETER_TOKEN = credentials('blazemeter-token')
  }

  stages {

    stage('Run App') {
      steps {
        sh 'make app'
      }
    }

    stage('Generate .bzt-rc from Credentials') {
      steps {
        sh """
          cat <<EOF >.bzt-rc
          modules:
            blazemeter:
              token: $BLAZEMETER_TOKEN
        """
        sh 'cat .bzt-rc'
      }
    }

    stage('Run Perf Tests') {
      steps {
        bzt 'bzt-configs/the-test.yml'
      }
    }

  }

  post {
    always {
      sh 'make clean'
    }
  }
}
