node('slave') {
    
    stage('dev'){
        try{
            sh 'docker stop lamp-ci-demo-dev && docker rm lamp-ci-demo-dev'
        }catch(exc){
            
        }
        docker.image('zijinghuang/dockerphpcidemo:latest').pull()
        docker.image('zijinghuang/dockerphpcidemo:latest').run('--name lamp-ci-demo-dev -p 8079:80')
    }
    stage('unit-test'){
        docker.image('zijinghuang/dockerphpcidemo:latest').pull()
        try{
            sh 'docker stop lamp-ci-demo-unittest && docker rm lamp-ci-demo-unittest'
        }catch(exc){
            
        }
        docker.image('zijinghuang/dockerphpcidemo:latest').run('--name lamp-ci-demo-unittest')
        sh 'docker exec lamp-ci-demo-unittest /app/vendor/bin/phpunit --log-junit /app/report.xml /app/indexTest.php'
        sh 'docker cp lamp-ci-demo-unittest:/app/report.xml /var/jenkins_slave/workspace/LAMP-CI-DEMO/report.xml'
        junit 'report.xml'
        // docker.image('zijinghuang/dockerphpcidemo:latest').inside('--name lamp-ci-demo-unittest'){
        //     sh '/app/vendor/bin/phpunit --log-junit /app/report.xml /app/indexTest.php'
        //     junit '/app/report.xml'
        // }
    }
    stage('test'){
        
    }
    stage('regression-test'){
        
    }
    stage('release'){
        try{
            sh 'docker stop lamp-ci-demo-online1 && docker rm lamp-ci-demo-online1'
        }catch(exc){
            
        }
        docker.image('zijinghuang/dockerphpcidemo:latest').pull()
        docker.image('zijinghuang/dockerphpcidemo:latest').run('--name lamp-ci-demo-online1 -p 8077:80')
        sh 'curl --request PUT --data @consul-online1.json http://zijing.us:8500/v1/agent/service/register'
        
        try{
            sh 'docker stop lamp-ci-demo-online2 && docker rm lamp-ci-demo-online2'
        }catch(exc){
            
        }
        docker.image('zijinghuang/dockerphpcidemo:latest').pull()
        docker.image('zijinghuang/dockerphpcidemo:latest').run('--name lamp-ci-demo-online2 -p 8076:80')
        sh 'curl --request PUT --data @consul-online2.json http://zijing.us:8500/v1/agent/service/register'
    }

   
}