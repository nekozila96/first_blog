pipeline{
    agent any
    stages {
        stage('Setup Python'){
            steps{
                sh '''
		        cd /var/lib/jenkins/workspace/Django/scripts
                sudo chmod +x Python_Setup.sh
                ./Python_Setup.sh
                '''
            }
        }
        
        stage('Setup Python Virtual ENV'){
	    steps  {
               sh '''
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

