pipeline{
    agent any
    stages {
        
        stage('Setup Python Virtual ENV'){
	    steps  {
               sh '''
	        cd /var/lib/jenkins/workspace/Django/scripts
               ./Python_Env.sh
               '''
	    }
        }
        stage('Setup Gunicorn Setup'){
            steps {
                sh '''
		cd /var/lib/jenkins/workspace/Django/scripts
                ./gunicorn.sh
                '''
            }
        }
        stage('setup NGINX'){
            steps {
                sh '''
		cd /var/lib/jenkins/workspace/Django/scripts
                ./nginx.sh
                '''
            }
        }
    }
}

