
1. Docker Images and Docker Compose.
You will need to understand where and why we are creating a file or changing it, these are the 2 most important things that you need to know to understand for now;

1 — Docker images: A Docker image is a template, this is the base that will “generate” the Container, it’s the foundation on where we will build our “docker environment”. You can find many Docker images at Docker Hub.

2 — Docker Compose: Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you can create and start all the services from your configuration.

Creating our Docker Compose file.
Now we will first create the file that will “orchestrate” all that we need to setup and run for our PostgreSQL and PGAdmin.

On any folder of your choice, create one file named: docker-compose.yml.

Inside this file we will add the following code:

version: '3.8'
services:
  db:
    container_name: postgres_container
    image: postgres
    restart: always
    environment:
      POSTGRES_DB: postgres_db
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: secret
      PGDATA: /var/lib/postgresql/data
    ports:
      - "5432:5432"
    volumes:
      - db-data:/var/lib/postgresql/data
  
  pgadmin:
    container_name: pgadmin4_container
    image: dpage/pgadmin4:5.5
    restart: always
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@admin.com
      PGADMIN_DEFAULT_PASSWORD: secret
      PGADMIN_LISTEN_PORT: 80
    ports:
      - "8080:80"
    volumes:
      - pgadmin-data:/var/lib/pgadmin
volumes:
  db-data:
  pgadmin-data:

From this moment you can already start using your database, but let’s cover what we see here briefly.

version: '3.8': This is the version of the 'tool' that is docker compose that will be used, basically, this is a script file, so to be interpreted we need to tell which version will be used, in this case, docker compose 3-8.
services: this is where we add all the 'services' that we want to run, in this case, we will have 2 services db and pgadmin, inside each service, we have specific configurations for each one of those.

container_name, image and restart: following the order, we need to specify a name for our container, this is important and you will see later when we specify to our pgadmin where/host to connect.

Image is the "image" that we want to use, it's the "VM" that we want to use when building. If you want to find more images available, you can find more in the link that we added to Docker hub.
Restart, this is for the scenario where our docker container stops, with this flag, it will restart automatically, of course, unless you complete shutdown your docker.

environment: these are environment variables that you would need to setup if you have it running on your machine or production server, as our container is a closed environment we need to declare using the keyword "environment" what will be available for each respective container.

ports: this is how we will redirect the access from the outside of our docker image to the image that we setup. For example, for the pgadmin, we say that when we access our machine using the port number 8080 we want it to be redirected/forward to our container/docker image to the port 80.

volumes: this is not a mandatory step but helps us organize our files, when we create our container we will need a path to persist the data that is for each container image, if we don't specify Docker will create one automatically, but we prefer to name it as it will help later if we decide to delete it.
Start, build and run.

We are ready to build and run, and it’s simple as was creating this file, first of all, make sure you have your Docker up and running.

Open your terminal, and if you want to make sure docker is running, type: docker info.


You should see something like this.
Now just go inside the folder that you have created for your docker compose file, and type this command: docker-compose up.


If this is your first time running this command, the first thing that will happen is it will download the images that you specified in your docker compose file.

If all is going ok, this is what you should see, it will start and show that you are ready to access it.


Now you can open your browser and type either http://localhost:8080 or http://127.0.0.1:8080 .


This is the screen that you should see, as configured in our docker compose file, the login credentials are:

Email: admin@admin.com
Password: secret


If you see this screen, this means that is all good and you have your PGAdmin up and running, you can also check your terminal where you started your docker images and see that the requests are being processed.


Configure the connection with your PostgreSQL database.
Now, let’s add to our PGAdmin our database access so we can manage and start using it, choose “Add New Server” and you should see the screen as it shows in the image below.


In the field name you can add any name, it’s not important as this is only for the organization inside the tool, the important part is the next one.

Select the tab “Connection” and in the field “Host name/address” you will add the postgres container name that you specified on your docker compose file, like this:


Also for the username and password, you will use those that you added to your docker compose:

Username: admin
Password: secret

The importance of using the docker container name is that we don’t need to know the IP of the container, so the next time that we restart will resolve without any problem.

To visualize, when we create these containers, basically this is how is created:


What is inside the “Docker” can communicate with each other, using either the host name or the ip address. In our case, we will use the host name as is always fixed.

If you want to know what the internal IP Address for your container is, you can check it using these two commands: 1 — Get the identifier for your postgres container using: docker ps. 2 - Print the IP of this docker ip address using his identifier: docker inspect b5c2c4484e15 | grep IPAddress. You should see something similar to this:


Ok, getting back to the creation, after adding the container name, user and password just hit save.


Done, we have the connection to our database and the ability to create a new database, table, manage users and easily adjust our PostgreSQL database.

Final commands and information.
You know how to start your docker compose, but how I can stop it?

Just type: docker-compose down.

How can I clean the data that is being saved for my docker container? You may want to completely reset, then you can achieve this by doing:

1 — Check the volumes that you have typing: docker volume ls.


On my computer, I only have these 2 but if you have more you will see more.

2 — Now that you have the name you can just type this to delete the data: docker volume rm dockerpostgrespgadmin_db-data dockerpostgrespgadmin_pgadmin-data.

This will remove both sets of data, but you can choose just one too. Remember, after you do this your database and any configuration will be erased.