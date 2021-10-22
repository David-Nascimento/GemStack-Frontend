pipeline {
    agent {
        docker {
            image 'papitoio/rubywd:latest'
            args '--network skynet'
        }
    }

    stages {
        stage('Build') {
            steps{
                echo "Compilando e/ou baixando dependencias"
                sh 'bundle install'
            }
        }

        stage('Test') {
            steps {
                echo 'Executando tests'
                sh 'cucumber -p ci'
            }
        }

        stage('UAT') {
            steps {
                echo 'Teste de aceitacao'
                input message: 'Podemos ir para producao?'
            }
        }

        stage('Prod') {
            steps {
                echo 'App pronto para producao!'
            }
        }
        
    }
}