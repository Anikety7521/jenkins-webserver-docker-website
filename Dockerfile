FROM httpd
 
COPY /var/lib/jenkins/workspace/project/index.html /usr/local/apache2/htdocs/

COPY /var/lib/jenkins/workspace/project/style.css /usr/local/apache2/htdocs/

COPY /var/lib/jenkins/workspace/project/script.js /usr/local/apache2/htdocs/
