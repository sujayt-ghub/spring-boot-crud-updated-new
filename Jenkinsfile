pipeline {
  agent {
    docker {
      image 'sujaysuj/docker-agent:v1'
      args '--user root -v /var/run/docker.sock:/var/run/docker.sock' // mount Docker socket to access the host's Docker daemon
    }
  }
  stages {
    stage('Checkout') {
      steps {
        sh 'echo passed'
        //git branch: 'main', url: 'https://github.com/sujayt-ghub/spring-boot-crud-updated.git'
      }
    }
    stage('Build and Test') {
      steps {
        sh 'ls -ltr'
        sh 'export DB_HOST=localhost'
        sh 'export DB_NAME=javatechie'
        sh 'export DB_USERNAME=root'
        sh 'export DB_PASSWORD=root'
        
        // build the project and create a JAR file
        // sh 'cd java-maven-sonar-argocd-helm-k8s/spring-boot-app && mvn clean package'
        sh 'mvn clean install'
      }
    }
    /*stage('Static Code Analysis') {
      environment {
        SONAR_URL = "http://192.168.0.121:9000"
      }
      steps {
        withCredentials([string(credentialsId: 'sonarqube', variable: 'SONAR_AUTH_TOKEN')]) {
          sh 'cd java-maven-sonar-argocd-helm-k8s/spring-boot-app && mvn sonar:sonar -Dsonar.login=$SONAR_AUTH_TOKEN -Dsonar.host.url=${SONAR_URL}'
        }
      }
    }*/
    stage('Build and Push Docker Image') {
      environment {
        DOCKER_IMAGE = "sujaysuj/springboot-crud-k8s:${BUILD_TAG}"
        // DOCKERFILE_LOCATION = "Dockerfile"
        REGISTRY_CREDENTIALS = credentials('docker-cred')
      }
      steps {
        script {
            // sh 'cd java-maven-sonar-argocd-helm-k8s/spring-boot-app && docker build -t ${DOCKER_IMAGE} .'
            sh 'docker build -t ${DOCKER_IMAGE} .'
            def dockerImage = docker.image("${DOCKER_IMAGE}")
            docker.withRegistry('https://index.docker.io/v1/', "docker-cred") {
                dockerImage.push()
            }
        }
      }
    }
    stage('Update Deployment File') {
        environment {
            GIT_REPO_NAME = "spring-boot-crud-updated"
            GIT_USER_NAME = "sujayt-ghub"
        }
        steps {
            withCredentials([string(credentialsId: 'github', variable: 'GITHUB_TOKEN')]) {
                sh '''
                    git config user.email "sujaysuj692@gmail.com"
                    git config user.name "sujayt-ghub"
                    BUILD_NUMBER1=${BUILD_TAG}
                    BUILD_NUMBER2="$BUILD_NUMBER1"
                  
               
                    sed -i "s+"newTag.*"+"newTag:PLUS_${BUILD_NUMBER2}_"+g" deployment.yaml
                    sed -i 's/_/"/g' deployment.yaml
                    sed -i 's/PLUS/ /g' deployment.yaml
                    git add deployment.yaml
                    git commit -m "Update deployment image to version ${BUILD_NUMBER}"
                    git remote set-url origin https://sujayt-ghub:${GITHUB_TOKEN}@github.com/sujayt-ghub/spring-boot-crud-updated.git
                    git push origin HEAD:main
                    ##git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:main
                    chmod -R 777 //var/lib/jenkins/workspace/
                '''
            }
        }
    }
  }
}
