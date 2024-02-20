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

      stage(' update npm') {
          steps {
            sh 'npm --version'
          }
        }

    stage('download dependencies') {
      steps {
        sh 'npm install'
      }
    }
 stage('download inconfy') {
          steps {
            sh 'npm rebuild node-sass'
          }
        }
    stage('Check linting') {
      steps {
        sh 'npm run lint'
      }
    }


    stage('Build') {
      steps {
        sh 'npm run build'
      }
    }

    stage('build icon') {
      steps {
        sh 'npm run build:icons -- --headless --url http://10.10.10.5'
      }
    }
  }
}
