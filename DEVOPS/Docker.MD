Docker commands::

docker --version
docker help
docker info

docker images
docker pull <image_name>:<tag>
docker push 
docker run -d --name <container_name> 8080:80 -p <image_name>: <tag> 
docker build -t <image_name>: <tag>
docker rm <image_name>: <tag>
docker start <container_name> 
docker stop <container_name>
docker container prune
docker ps -a
docker exec -it <container_name> <command>
docker inspect <container_id_or_name>

docker network ls
docker network create <network_name>
docker network connect <network_name> <container_id_or_name>

docker volume ls
docker volume create <volume_name>
docker volume rm <volume_name>
docker run -d -v <volume_name>:<container_path> <image_name>

docker logs <container_id_or_name>
docker stats

docker-compose up
docker-compose up -d
docker-compose down
docker-compose ps

for docker image layers
docker history <image-name>

FROM setup base image 
WORKDIR setup base working directory to execute all the cmds, copies etc
ADD
COPY 
RUN
EXPOSE
ENTRYPOINT
CMD


bhargav@sivaramaprasad155gmail.onmicrosoft.com
Qudo137056

jenkins
siva
jenkins@366

1.Arifcat management in jenkins azure blob/ amazon S3 bucket optimze performanace and cost reduction by small plans using shell scriting.
2.Docker images as well same pattern will follow
3.jenkins pararlell jobs / for building different builds like nodejs, msbuild, 


Sleep - 7 Hours


# serrver side applications backend ressponsible for processing requestes, interacting with the database handling business logics [nodejs,spring,Django etc] 

# client side applications frontend technoliges html , css, angular, react

linkedin 
155@gmail.com
Devops@2025