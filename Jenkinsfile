#!groovy
pipeline {
    agent {
        label 'ingestor'
    }
    stages {
        stage('Script Permission') {
            steps {
                sh 'chmod a+x ./purgeStorage.sh'
                sh 'chmod a+x ./restart.sh'
                sh 'chmod a+x ./register.sh'
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
        stage('Initial service start up') {
            steps {
                sh 'make up'
                sh 'sleep 1m'
            }
        }
        stage('Prepare database') {
            steps {
                sh 'chmod a+x ./settings/db/grantaccess.sh'
                sh 'make prepdb'
            }
        }
        stage('Reboot services') {
            steps {
                sh './restart.sh'
            }
        }
        stage('Register') {
            steps {
                sh './register.sh'
            }
        }
    }
}
