pipeline{
    agent any
    stages{
        stage('Setup Python Virtual ENV for dependencies'){
        

        steps{
            sh '''
            chmod +x env-setup.sh
            ./envsetup.sh
            '''
        }
        }
        
        stage('Setup Gunicorn Setup'){
            steps{
                sh '''
                chmod +x gunicorn.sh
                ./gunicorn.sh
                '''
            }
        }

        stage('Setup Nginx'){
            steps{
                sh '''
                chmod +x nginx.sh
                ./nginx.sh
                '''
            }
        }
    }    
}