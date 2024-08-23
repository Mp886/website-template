pipeline{
    agent any
    
    stages{
        stage("Code Checkout"){
            steps{
               echo "Checking out the code from Github" 
               git url:"https://github.com/Mp886/website-template.git", branch:"main"
            }
        }
        stage("Build Image"){
            steps{
                echo "Build the image"
                sh "docker build -t website-template ."
            }
        }
        stage("push to image registry"){
            steps{
                echo "push the image to docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"dockerhubpass",usernameVariable:"dockerhubuser")]){
                sh "docker tag website-template ${env.dockerhubuser}/website-template:v1"
                sh "docker login -u ${env.dockerhubuser} -p ${env.dockerhubpass}"
                sh "docker push ${env.dockerhubuser}/website-template:v1 "
                }
            }
        }
        stage("Deploy"){
            steps{
                echo "Deploy the image to the container"
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
