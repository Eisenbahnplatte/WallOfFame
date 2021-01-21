#!/bin/bash

#cd "$( dirname "${BASH_SOURCE[0]}" )"

#prepare directories for calculated files
#DATE=$(date +%y-%m-%d)
#DIR=$(pwd)/uniformedWebIds/
#VERSIONDIR=$(pwd)/uniformedWebids/$DATE
cd ../
mvn spring-boot:run -Dstart-class=org.dbpedia.walloffame.DatabusApplication -Dspring-boot.run.arguments=databus/uniformedWebIds/$(date +%y-%m-%d)

#push data to DBpedia Databus
cd databus/uniformedWebIds/
mvn versions:set -DnewVersion=$(date +%y-%m-%d)
mvn prepare-package 
mvn databus:package-export
mvn databus:deploy
