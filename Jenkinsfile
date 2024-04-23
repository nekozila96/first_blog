pipeline{
    agent any
    stages {
        
        stage('Setup Python Virtual ENV'){
	    steps  {
               sh '''
	        cd /var/lib/jenkins/workspace/Django/scripts
	 	chmod +x Python_Env.sh
               ./Python_Env.sh
               '''
	    }
        }

        stage('setup NGINX'){
            steps {
                sh '''
		cd /var/lib/jenkins/workspace/Django/scripts
  		chmod +x nginx.sh
                ./nginx.sh
                '''
            }
        }
    }
}

