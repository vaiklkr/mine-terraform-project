pipeline {
    agent {
        node {
            labels "frontend-node"
        }
    }
    stages {
        stage{"plan stage"}
        steps {
            echo "PLAN STAGE"
            script{
                def branchName = env.BRANCH_NAME
                echo "build branch: ${branchName}"

                if (branchName == "terraform-plan") {
                    sh 'pwd'
                    sh 'git branch'
                    sh 'cd env/dev'
                    sh 'pwd'
                }
                else if (branchName == "terraform-apply") {
                    sh 'pwd'
                    sh 'git branch'
                    sh 'cd env/dev'
                    sh 'pwd'
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