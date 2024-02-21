pipeline {
  agent any
  tools {nodejs "nodejs"}
  environment {
      DEPLOYMENT_NAME = 'vuejs-admin'
      DOCKER_IMAGE = "dotiendat1751998/vuejs-admin:1.1"
      DOCKER_FILE = './Dockerfile'
      DOCKER_COMPOSE = 'docker-compose-vue.yml'

    }
  stages {
//
//     stage('download dependencies') {
//       steps {
//         sh 'npm install'
//       }
//     }
//     stage('Check lint') {
//       steps {
//         sh 'npm run lint'
//       }
//     }
//
//     stage('Build') {
//       steps {
//         sh 'npm run build'
//       }
//     }
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
    stage('Deploy') {
      steps {
        echo 'Next Deploy job run...'
//         sh 'docker compose -f ${DOCKER_COMPOSE} -H "ssh://root@10.10.10.5" up -d  '
        $class: 'DockerComposeBuilder', dockerComposeFile: '${DOCKER_COMPOSE}', option: [$class:'StartService',scale:1,service:'vuejs'],useCustomDockerComposeFile: true
      }
    }

  }
}
