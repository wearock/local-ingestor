#!groovy
pipeline {
    agent {
        label 'docker'
    }
    stages {
        stage('Script Permission') {
            steps {
                sh 'chmod a+x ./purgeStorage.sh'
                sh 'chmod a+x ./restart.sh'
            }
        }
        stage('Clean up') {
            steps {
                sh 'make clean'
                sh './purgeStorage.sh'
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
                sh './restart.sh'
            }
        }
    }
}