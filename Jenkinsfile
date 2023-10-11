pipeline{
    agent any
    environment{
        DOCKERHUB_PASS = credentials('@swathi08G')
    }
    stages
    {
        stage('Buiding the student survey image')
        {
            steps
            {
                script{
                    checkout scm
                    sh 'rm -rf *.war'
                    sh 'jar -cvf form1-1.war -c WebContent/ .'
                    sh 'echo ${BUILD_TIMESTAMP}'
                    sh 'docker login -u swathiguptha -p ${DOCKERHUB_PASS}'
                    def customImg = docker.build("swathiguptha/student-form-image:${BUILD_TIMESTAMP}")
                }
            }
        }
        stage('Pushing docker image to Docker Hub')
        {
            steps
            {
                script{
                    sh 'docker push swathiguptha/student-form-image:${BUILD_TIMESTAMP}'
                }
            }
        }
        stage('Deploying as a pod to rancher')
        {
            steps
            {
                sh 'kubectl set image deployment/survey-pipeline survey-pipeline=swathiguptha/student-form-image:${BUILD_TIMESTAMP} -n jenkins-pipeline'
            }
        }

    }
}
