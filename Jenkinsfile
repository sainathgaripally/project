pipeline {
    agent { label 'dockernode'}
    environment {
        registry = 'sainathgaripally/june'
        regsistryCredentials = 'docker-hub'
        dockerImage = ''
    }
    stages {
        stage ('build docker image') {
            when {
                expression {
                    BRANCH_NAME == "master"
                }
                steps {
                    script {
                        dockerImage = docker.build registry + ":$BRANCH_NUMBER"
                    }
                }
            }
        }
        stage ('push docker image') {
            when {
                expression {
                    BRANCH_NAME == "master"
                }
                steps {
                    script{
                        docker.withRegistry('', regsistryCredentials)
                        dockerImage.push("$BRANCH_NUMBER")
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}
