pipeline {
    agent any 
    stages {
        // Borramos el stage de Checkout porque Jenkins ya lo hizo arriba
        stage('Permisos y Validacion') {
            steps {
                sh 'chmod +x install_filebeat.sh'
            }
        }
        stage('Despliegue en Servidor') {
            steps {
                sh './install_filebeat.sh'
            }
        }
        stage('Verificación Final') {
            steps {
                sh 'systemctl is-active filebeat'
            }
        }
    }
    post {
        success { echo "¡Despliegue exitoso!" }
        failure { echo "Algo falló. Revisa los logs." }
    }
}

