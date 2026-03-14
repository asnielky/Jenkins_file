pipeline {
    agent any // Se ejecuta en cualquier nodo disponible

    stages {
        stage('Checkout') {
            steps {
                // Descargamos el script desde Git
                git 'https://github.com'
            }
        }

        stage('Permisos y Validacion') {
            steps {
                // Preparamos el archivo
                sh 'chmod +x install_filebeat.sh'
            }
        }

        stage('Despliegue en Servidor') {
            steps {
                // Ejecutamos el script que ya probaste en la terminal
                sh './install_filebeat.sh'
            }
        }

        stage('Verificación Final') {
            steps {
                // Comprobamos que el servicio quedó "active"
                sh 'systemctl is-active filebeat'
            }
        }
    }

    post {
        success {
            echo "¡El servidor ya está enviando logs a ELK!"
        }
        failure {
            echo "Algo falló en el despliegue. Revisar logs de Jenkins."
        }
    }
}
