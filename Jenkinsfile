pipeline {
    agent any
    stages {
        stage('Building Docker Image') {
            steps {
              script {
                sh 'docker build -t sainathgaripally/test1 .'
      	      }
            }
        }
    }
}
