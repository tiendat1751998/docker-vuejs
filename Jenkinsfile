pipeline {
  agent any
  tools {nodejs "nodejs"}
  stages {

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
    stage('Check lint') {
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
