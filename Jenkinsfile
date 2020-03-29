pipeline{
    agent {
        docker {
            image "ruby:alpine"
            args "--network=skynet"
        }
    }
    stages {
        stage("Build"){
            steps{
                sh "chmod +x build/alpine.sh"
                sh "./build/alpine.sh"
				sh "bundle install"
            }
        }
        stage("Tests"){
            steps{
            sh "bundler exec cucumber @login_happy -p ci"
            }
        }
    }
}
