pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                  
                    // Construisez l'image Docker
                    bat 'docker build -t flutter_image .'
                }
            }
        }

        // stage('Run') {
        //     steps {
        //         script {
        //             // Exécutez le conteneur Docker
        //             bat 'docker run -p 8001:8080 flutter_image'
        //         }
        //     }
        // }
    }
}