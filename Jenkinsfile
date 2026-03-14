pipeline {
    agent any 
    stages {
        // Borramos el stage de Checkout porque Jenkins ya lo hizo arriba
        stage('Permisos y Validacion') {
            steps {
		sh 'whoami'
                sh 'sudo chmod +x install_filebeat.sh'
            }
        }
        stage('Despliegue en Servidor') {
            steps {
                sh 'sudo ./install_filebeat.sh'
            }
        }
        stage('Verificación Final') {
            steps {
                sh 'sudo systemctl is-active filebeat'
            }
        }
    }
    post {
        success { echo "¡Despliegue exitoso!" }
        failure { echo "Algo falló. Revisa los logs." }
    }
}

