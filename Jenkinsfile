pipeline {
    environment {
        docker_image = ''
        registry = 'sainathgaripally/project'
        registryCredential = 'docker-hub'
    }
    agent any 
        stages {
            stage('Building Image') {
                steps {
                    echo 'bulding docker image...'
                    script {
                        docker_image = docker.build registry + ":$BUILD_NUMBER"
                    }
                }
            }
            stage('Deploy Image') {
                steps {
                    echo 'puhsing docker image'
                    script {
                        docker.withRegistry('', registryCredential)                    
                        dockerImage.push('$BUILD_NUMBER')
                        dockerImage.push('latest')
                }
                }
            }
            stage('clean up'){
                steps {
                    sh "docker rmi $registry:$BUILD_NUMBER"
                    sh "docker rmi $registry:latest"
                }
            }
            stage('deploy') {
                steps {
                    echo 'deploying...'
                    script {
                        sh "kubectl apply -f deployment.yml"
                        sh "kubectl apply -f service.yml"
                    }
                }
            }
    }
}
