DAPS (DocBook Authoring and Publishing Suite) is a toolchain used to build documentation for SUSE. This image is build on top of openSUSE Tumbleweed.



# Usage

The container cannot access your DCFILE without mounting the folder as a volume inside the container. The easiest and most re-usable way is to install Docker with Docker Compose and create a `docker-compose.yml` file in the root directory of your documentation project:



```

docker-compose.yml

DC-guide

xml/

```



The content of the file should be something like this:



```

version: '3'



services:

  daps:

    image: lkucharczyk/daps

    container_name: daps

    volumes:

      - ./:/files

```



Run the container by entering this command in the directory: `docker-compose up -d`.



This will mount the directory with `docker-compose.yml` as `/files` inside the container. The container will keep running until you stop it. Afterwards, you can run and re-run this command to generate the documentation: `docker exec daps daps -d DCFILE html`.
