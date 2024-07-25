pipeline {
  agent any
  tools {nodejs "nodejs"}
  environment {
      DEPLOYMENT_NAME = 'vuejs-admin'
      DOCKER_IMAGE = "dotiendat1751998/vuejs-admin"
      DOCKER_FILE = './Dockerfile'
      DOCKER_COMPOSE = './docker-compose-vue.yml'

    }
  stages {
    stage('Build docker') {
      steps {
        echo 'Building..'
        sh "docker build -t ${DOCKER_IMAGE} -f ${DOCKER_FILE} ."
        echo 'Build Done....'
      }
    }
    stage('Login') {
          steps {
            script {
              // Login to Docker Hub using Jenkins global credentials
              withCredentials([usernamePassword(
                credentialsId: '0978ddcf-0186-4334-8520-b32a2e12a710', // Use the Global credentials ID
                usernameVariable: 'DOCKERHUB_USERNAME',
                passwordVariable: 'DOCKERHUB_PASSWORD'
              )]) {
                echo ${DOCKERHUB_PASSWORD}
                sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
              }
            }
          }
    }

    stage('push docker') {
           steps {
             echo 'push..'
             sh 'docker push ${DOCKER_IMAGE}'
             echo 'push Done..'
           }
         }
  }
}
