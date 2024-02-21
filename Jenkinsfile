pipeline {
  agent any
  tools {nodejs "nodejs"}
  stages {

    stage('download dependencies') {
      steps {
        sh 'npm install'
      }
    }
//  stage('download inconfy') {
//           steps {
//             sh 'npm rebuild node-sass'
//           }
//         }
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

//     stage('build icon') {
//       steps {
//         sh 'npm run build:icons -- --headless --url http://10.10.10.5'
//       }
//     }
environment {
    DEPLOYMENT_NAME = 'vuejs-admin'
    DOCKER_IMAGE = "dotiendat1751998/vuejs-admin:1.1"
    DOCKER_FILE = './Dockerfile'
  }
  stages {
    stage('Login') {
      steps {
        script {
          // Login to Docker Hub using Jenkins global credentials
          withCredentials([usernamePassword(
            credentialsId: 'repo', // Use the Global credentials ID
            usernameVariable: 'DOCKERHUB_USERNAME',
            passwordVariable: 'DOCKERHUB_PASSWORD'
          )]) {
            sh "docker login https://hub.docker.com/ -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
          }
        }
      }
    }
    stage('Build') {
      steps {
        echo 'Building..'
        sh "docker build -t ${DOCKER_IMAGE} --security-opt=seccomp=unconfined -f ${DOCKER_FILE} ."
        sh 'docker push ${DOCKER_IMAGE}'
        echo 'Build Done..'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Next Deploy job run....'
      }
    }
  }
}
