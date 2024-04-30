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

        stage('Check Python Version'){
	    steps  {
           sh '''
            cd /var/lib/jenkins/workspace/Django/scripts
		chmod +x Check_Python.sh
            ./Check_Python.sh
            '''
    	    }
        }
       
    }
}

