pipeline{
    agent any
    stages {
 	   
        
        stage('Setup Python Virtual ENV'){
	    steps  {
               sh '''
               cd /var/jenkins_home/workspace/Django/scripts
               chmod +x Python_Env.sh
               ./Python_Env.sh
               '''
	    }
        }
        stage('Setup Gunicorn Setup'){
            steps {
                sh '''
                chmod +x gunicorn.sh
                ./gunicorn.sh
                '''
            }
        }
        stage('setup NGINX'){
            steps {
                sh '''
                chmod +x nginx.sh
                ./nginx.sh
                '''
            }
        }
    }
}

