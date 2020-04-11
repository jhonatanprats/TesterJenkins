def COLOR_MAP = ['SUCESS': 'good', 'FAILURE': 'danger', 'UNSTABLE': 'danger', 'ABORTED': 'danger']

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
                sh "bundler exec cucumber -p ci"
            }
            post {
                always{
                    cucumber failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', pendingStepsNumber: -1, skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
                    slackSend channel: "#testesautomatizados", 
                        color: COLOR_MAP[currentBuild.currentResult],
                        message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n Mais informações acesse: ${env.BUILD_URL}"

                }
            }
        }
    }
}
