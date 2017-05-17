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
        performanceReport compareBuildPrevious: false, configType: '', errorFailedThreshold: -1, errorUnstableResponseTimeThreshold: '', errorUnstableThreshold: -1, failBuildIfNoResultFile: false, modeOfThreshold: false, modePerformancePerTestCase: true, modeThroughput: false, nthBuildNumber: 0, relativeFailedThresholdNegative: <object of type java.lang.Double>, relativeFailedThresholdPositive: <object of type java.lang.Double>, relativeUnstableThresholdNegative: <object of type java.lang.Double>, relativeUnstableThresholdPositive: <object of type java.lang.Double>, sourceDataFiles: "$WORKSPACE/artifacts/result.xml"
      }
    }
  }
  post {
    always {
      sh 'make clean'
    }
  }
}
