pipeline {
  agent any
  stages {
    stage('Pre Clean') {
      steps {
        sh 'make clean'
      }
    }
    stage('Run App') {
      steps {
        sh 'make app'
      }
    }
    stage('Run Perf') {
      steps {
        sh 'make env && make perf'
      }
    }
    stage('Post Clean') {
      steps {
        sh 'make clean'
      }
    }
  }
}