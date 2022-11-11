pipeline {
    
    agent {
        label "node 1"
    }
    
    stages {
        stage("SCM") {
            steps {
                git branch: 'main', url: 'https://github.com/Anikety7521/jenkins-webserver-docker-website.git'
            }
        }
        
        stage("conf system using ansible") {
            steps {
                sh 'ansible-playbook webserver.yml'
            }
        }
        
        stage("creating docker image") {
            steps {
                sh 'sudo docker build -t  aniket86/webserver:${BUILD_TAG}  . '
            }
        }
        
        stage("pushing image to dockerhub") {
            steps {
                withCredentials([string(credentialsId: 'Dockerhub_passwd', variable: 'DOCKER_HUB_PASS_CODE')]) {
 
                 sh "sudo docker login -u aniket86 -p $DOCKER_HUB_PASS_CODE"
               }
              sh "sudo docker push aniket86/webserver:${BUILD_TAG}"
            }
        }
        
        stage("Deploying webserver using ansible") {
            steps {
                sh 'ansible-playbook deploy_web.yml'
            }
        }
      
        
    }
}
