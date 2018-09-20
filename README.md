[![Build Status](https://travis-ci.com/dbjpanda/drupal-on-docker.svg?token=55CADUHzgmryMHLpbyAs&branch=master)](https://travis-ci.com/dbjpanda/drupal-on-docker)

Setup Traefik (Recommended)
--------------
Enable Traefik proxy server following below commands to access your services using a "Domain name" instead of "IP:port". This is an one time setup and use with all projects. This is useful for both Drupal and Non-Drupal projects. As this project is configured to work with Traefik by default so we recommend you should set up it first if you have not done it yet. If you don't want to enable Traefik, then you need to manually provide a port number to services and access them using localhost:port.
```
docker network create -d bridge traefik-network
docker run -d --network=traefik-network -p 80:80 -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock --name=traefik traefik:latest --api --docker
```

Installation 
------------
Step 1 
``````
git clone https://github.com/dbjpanda/drupal-on-docker.git
```````
Step 2 
````````
Rename .env.example to .env and modify the variables like PROJECT_NAME etc as per your requirements
``````````````
Step 3
````````
docker-compose up -d
````````

Step 4
````````
docker exec -it PROJECT_NAME composer install
````````


Deployment to a server through Travis CI
----------------------------------------
Step 1 (Execute below commands on your local machine while inside the repo)
``````
./server-setup.sh
``````

Step 2 
``````
Change required variables inside env section of .travis.yml file 
``````




