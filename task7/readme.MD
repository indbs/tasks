#force recreate
docker-compose up -d --force-recreate --build

#run builder
docker-compose run builder

#stop deployer
docker-compose stop deployer

#list services
docker-compose ps