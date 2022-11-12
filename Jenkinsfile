pipeline {
    
    agent any
    
    stages {
        stage("SCM") {
            steps {
                git branch: 'main', url: 'https://github.com/Anikety7521/jenkins-webserver-docker-website.git'
            }
        }
        

        stage("creating docker image") {
            steps {
                sh 'sudo docker build -t  aniket86/webserver:${BUILD_TAG}  /var/lib/jenkins/workspace/project/ '
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
        
        stage("conf system using ansible") {
            steps {
                sh 'sudo ansible-playbook webserver.yml'
            }
        }
        
        
      
        
    }
    
    post {
         always {
             echo "You can always see me"
         }
         success {
              echo "I am running because the job ran successfully"
         }
         unstable {
              echo "Gear up ! The build is unstable. Try fix it"
         }
         failure {
             echo "OMG ! The build failed"
         }
     }
}
