pipeline {
    options {
            buildDiscarder(logRotator(numToKeepStr: '3', daysToKeepStr: '3'))
            ansiColor('xterm')
    }
    agent {
        node {
            label "frontend-node"
        }
    }
    stages {
        stage ("deployment stage with if-else if"){
            steps {                

                script{
                    def branchName = env.BRANCH_NAME
                    echo "build branch: ${branchName}"

                    if (branchName == "dev") {
                        sh 'pwd'
                        sh 'git branch'
                        echo "terraform deploy on dev environment"
                        dir('envs/dev') {
                            sh '''
                                pwd                                
                                terraform init
                                sleep 3
                                terraform plan
                                sleep 3                                
                                terraform apply -auto-approve
                            '''
                        }                        
                    }
                    else if (branchName == "staging") {
                        sh 'pwd'
                        sh 'git branch'
                        echo "terraform deploy on staging environment"
                        dir('envs/staging') {
                            sh '''
                                pwd
                                terraform init
                                sleep 3
                                terraform plan
                                sleep 3
                                terraform apply -auto-approve
                            '''
                        }
                    }
                    else if (branchName == "master"){
                        sh 'pwd'
                        sh 'git branch'
                        echo "terraform deploy on prod environment"
                        dir('envs/prod') {
                            sh '''
                                pwd
                                terraform init
                                sleep 3
                                terraform plan
                                sleep 3
                                terraform apply -auto-approve
                            '''
                        }
                    }

                }
            }
        }
    }
}