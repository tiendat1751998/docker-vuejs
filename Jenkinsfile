pipeline {
  agent any
  tools {nodejs "nodejs"}
  stages {
//     stage('Check for vulnerabilities') {
//       steps {
//         sh 'npm audit --parseable --production'
//         sh 'npm outdated || exit 0'
//       }
//     }
    stage(' install vue js') {
      steps {
        sh 'npm install vue'
      }
    }
      stage(' install vue js cli') {
          steps {
            sh 'npm install --global vue-cli'
          }
        }

    stage('download dependencies') {
      steps {
        sh 'npm install'
      }
    }

    stage('audit fix') {
      steps {
        sh 'npm audit fix'
      }
    }

//     stage('Check linting') {
//       steps {
//         sh 'npm run lint'
//       }
//     }

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