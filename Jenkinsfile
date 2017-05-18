pipeline {
  agent any
  stages {
    stage('Run App') {
      steps {
        sh 'make app'
      }
    }
    stage('Run Perf Tests') {
      steps {
        sh 'make bzt'
      }
    }
    stage('Publish Test Results') {
      steps {
        //see JENKINS-32650 and JENKINS-31967
        performanceReport compareBuildPrevious: false, configType: '', errorFailedThreshold: -1, errorUnstableResponseTimeThreshold: '', errorUnstableThreshold: -1, failBuildIfNoResultFile: false, modeOfThreshold: false, modePerformancePerTestCase: true, modeThroughput: false, nthBuildNumber: 0, relativeFailedThresholdNegative: -1, relativeFailedThresholdPositive: -1, relativeUnstableThresholdNegative: -1, relativeUnstableThresholdPositive: -1, sourceDataFiles: "/var/jenkins_home/artifacts/result.xml"
        //TODO add dir above to env
      }
    }
  }
  post {
    always {
      sh 'make clean'
    }
  }
}
