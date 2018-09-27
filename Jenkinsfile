#!groovy
pipeline {
    agent {
        label 'docker'
    }
    stages {
        stage('Clean up') {
            steps {
                sh 'make clean'
            }
        }
        stage('Upgrade images') {
            steps {
                sh 'make updateimgs'
            }
        }
        stage('Run services') {
            steps {
                sh 'make up'
                sh 'sleep 1m'
                sh 'chmod a+x ./settings/db/grantaccess.sh'
                sh 'make prepdb'
            }
        }
    }
}