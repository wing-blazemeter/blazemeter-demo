pipeline {
  agent any
  stages {
    stage('Run App Container') {
      steps {
        sh 'make app'
      }
    }
    stage('Run Taurus Perf Tests') {
      steps {
        bzt 'bzt-configs/the-test.yml'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying...'
      }
    }
  }
  post {
    always {
      sh 'make clean'
    }
    unstable {
      echo 'Unstable!'
      //send an email or post to HipChat/Slack..
    }
  }
}
