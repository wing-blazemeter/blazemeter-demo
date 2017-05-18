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

    stage('Generate .bzt-rc') {
      steps {
        sh """
          cat <<EOF >.bzt-rc
          modules:
            blazemeter:
              token: $BLAZEMETER_TOKEN
          EOF
        """
        sh 'cat .bzt-rc'
      }
    }

    stage('Run Perf Tests') {
      steps {
        sh 'make bzt-jenkins'
      }
    }

    stage('Publish Test Results') {
      steps {
        //see JENKINS-32650 and JENKINS-31967
        performanceReport compareBuildPrevious: false, configType: '', errorFailedThreshold: -1, errorUnstableResponseTimeThreshold: '', errorUnstableThreshold: -1, failBuildIfNoResultFile: false, modeOfThreshold: false, modePerformancePerTestCase: true, modeThroughput: false, nthBuildNumber: 0, relativeFailedThresholdNegative: -1, relativeFailedThresholdPositive: -1, relativeUnstableThresholdNegative: -1, relativeUnstableThresholdPositive: -1, sourceDataFiles: "/var/jenkins_home/artifacts/results.xml"
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
