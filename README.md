Prerequisites: 
-----------
1. Install Maven 3.3.9
2. Install Docker and Docker-Compose    
--------------------------
    
    
Building and Running
--------------------

Run webapp using :

    ./execute.sh

Per default the webapp is accessible at port 8080. You can start browsing at:

    localhost:8080/         ,or
    localhost:8080/validate

Get all WebIds of Wall of Fame:

    mvn spring-boot:run -Dstart-class=org.dbpedia.walloffame.DatabusApplication

Push WebIds of WallOfFame to DBpedia Databus:

    mvn spring-boot:run -Dstart-class=org.dbpedia.walloffame.DatabusApplication -Dspring-boot.run.arguments=databus/uniformedWebIds/$(date +%y-%m-%d) && cd databus/uniformedWebIds/ && mvn versions:set -DnewVersion=$(date +%y-%m-%d) && mvn prepare-package && mvn databus:package-export && mvn databus:deploy