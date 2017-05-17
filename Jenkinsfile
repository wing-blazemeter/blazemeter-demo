pipeline {
  agent any
  stages {
    stage('Pre Clean') {
      steps {
        sh 'docker rm $(docker stop $(docker ps -a -q --filter ancestor="blaze-app" --format="{{.ID}}")) || true'
      }
    }
    stage('Run App') {
      steps {
        sh 'docker build -f Dockerfile.app -t blaze-app . && docker run -d -p 8888:80 --name=blaze-app --network=blazemeter-demo blaze-app'
      }
    }
    stage('Run Perf') {
      steps {
        sh '''docker build \
-f Dockerfile.taurus \
-t bzt . \
&& docker run \
-v ./artifacts:/tmp/artifacts/ \
--network=blazemeter-demo \
bzt \
/bzt-configs/the-test.yml -report'''
      }
    }
    stage('Post Clean') {
      steps {
        sh 'docker rm $(docker stop $(docker ps -a -q --filter ancestor="blaze-app" --format="{{.ID}}")) || true'
      }
    }
  }
}