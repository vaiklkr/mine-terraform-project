pipeline {
    options {
            buildDiscarder(logRotator(numToKeepStr: '3', daysToKeepStr: '3'))
    }
    agent {
        node {
            label "frontend-node"
        }
    }
    stages {
        stage ("plan stage"){
            steps {
                echo "PLAN STAGE"
                script{
                    def branchName = env.BRANCH_NAME
                    echo "build branch: ${branchName}"

                    if (branchName == "terraform-plan") {
                        sh 'pwd'
                        sh 'git branch'
                        dir('envs/dev') {
                            sh '''
                                pwd
                                terraform init
                                terraform plan
                            '''
                        }
                        sh 'sleep 8'
                        dir('envs/staging') {
                            sh '''
                                pwd
                                terraform init
                                terraform plan
                            '''
                        }
                        sh 'sleep 6'
                    }
                    else if (branchName == "terraform-apply") {
                        sh 'pwd'
                        sh 'git branch'
                        dir('env/dev') {
                            sh '''
                                pwd
                                terraform apply
                            '''
                        }
                    }
                    else if (branchName == "terraform-destroy"){
                        sh 'pwd'
                        sh 'git branch'
                        sh 'cd env/dev'
                        sh 'pwd'
                    }

                }
            }
        }
    }
}