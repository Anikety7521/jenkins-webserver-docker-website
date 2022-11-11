FROM httpd
 
COPY /home/ec2-user/jenkins/workspace/project/ /usr/local/apache2/htdocs/
