pipeline {
  agent any
  stages {
    stage('Pre Clean') {
      steps {
        sh 'docker stop $(docker ps -q --filter ancestor="blazemeter-demo-app") || true'
      }
    }
    stage('Run App') {
      steps {
        sh 'docker build -f Dockerfile.app -t blaze-app . && docker run -d -p 8888:80 --name=blaze-app --network=blazemeter-demo blaze-app'
      }
    }
    stage('Sleep') {
      steps {
        sleep 60
      }
    }
    stage('Post Clean') {
      steps {
        sh 'docker stop $(docker ps -q --filter ancestor="blazemeter-demo-app") || true'
      }
    }
  }
}