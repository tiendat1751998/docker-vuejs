pipeline {
  agent any
  checkout scmGit(
      branches: [[name: 'master']],
      userRemoteConfigs: [[url: 'https://github.com/tiendat1751998/docker-vuejs.git']])
  stages {
//     stage('Check for vulnerabilities') {
//       steps {
//         sh 'npm audit --parseable --production'
//         sh 'npm outdated || exit 0'
//       }
//     }

 stage('Test npm') {
      steps {
        sh """
          npm --version
        """
      }
    }

    stage('download dependencies') {
      steps {
        sh 'npm install'
      }
    }

    stage('Check linting') {
      steps {
        sh 'npm run lint'
      }
    }

//     stage('Check unit:test') {
//       steps {
//         sh 'npm run test:unit -- --ci --coverage'
//       }
//       post {
//         always {
//           junit 'junit.xml'
//           cobertura coberturaReportFile: 'coverage/cobertura-coverage.xml'
//         }
//       }
//     }

    stage('Build') {
      steps {
        sh 'npm run build'
      }
    }

//     stage('Check unit:e2e') {
//       steps {
//         sh 'npm run test:e2e -- --headless --url https://www.trelobifteki.com --config video=false'
//       }
//     }
  }
}
