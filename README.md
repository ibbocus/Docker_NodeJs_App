# ocker_NodeJs_App


### What is Docker?
- It is an open source platform for containerisation
- Docker enables you to separate your infrastructure so you can deliver your software quickly

### Why should we use Docker?
- Because it doesn’t make a difference what OS you are using - Increasing its portability and ease of use of the user
- Large library of images to build containers from
- Docker is fast as it only contains the files require to run the app rather than a full on VM
- Provides consistent delivery of your applications and can be scaled up very well

### What is container?
- Process of spinning up virtual environments within containers.
- You can pull any container, change the container re tag it and make changes. You can then repush that new container

### Benefits of containers
- Creating a vm to test out all operating systems, test installation of software

### What is the difference between VMs and Docker
- Docker is lightweight compared to VMs… but how? Docker shares the resources of an OS rather than creating a entire virtual environment.

### Microservices

Microservices – Also known as the microservice architecture is an architecture style that structures an application as a collection of services that are:
Highly maintainable and testable
- loosely coupled
- Independently deployable
- Organized around business capability’s
- Owned by a small team

Cons
- Results in more complex systems than monolithic architecture - This is unnecessary for small companies


### Microservices Docker Nodejs App and db task

App Docker file

```
# select base image to build our own customised node app microservice

FROM node:alpine

# working directory inside the container

WORKDIR /usr/src/app

# copy dependencies

COPY package*.json ./

# Install npm

RUN npm install

# copy everything from current location to default location inside the container

COPY . .

# define the port

EXPOSE 3000

# start the app with CMD

CMD ["node","app.js"]

```


docker-compose file

```
version: '3'

services:
  db:
    image: mongo
    restart: always
    ports: [27017:27017]

  web:
    build: ./app
    restart: always
    ports: [3000:3000]
    environment:
      - DB_HOST=mongodb://db:27017/posts
    depends_on:
      - db


```
