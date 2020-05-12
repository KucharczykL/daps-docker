A Docker image of DAPS (DocBook Authoring and Publishing Suite), a toolchain used to build documentation for SUSE. This image is built on top of openSUSE Tumbleweed.

# Example Usage

1. Create a `docker-compose.yml` file in your documentation root directory (where DCFILE is).
   The content of the file should be something like this:
```yaml
version: '3'
services:
  daps:
    image: lkucharczyk/daps
    container_name: daps
    volumes:
      - ./:/files
```
2. Create the container by entering this command in the directory: `docker-compose up -d`.
3. Run your DAPS command: `docker exec daps daps -d DCFILE html`.

# Limitations
* The container cannot access outside files unless explicitly specified. For this reason, in the example above, the current   working directory is mounted as `/files` inside the container and the `Dockerfile` specifies this as the working directory. This means the `daps` command will run directly from there without you having to specify it.
* A side effect of mounting the directory is that you cannot re-use the existing container for a different directory. You need to:
1. tear down the existing container with `docker-compose down` and then repeat the steps above to get it working somewhere else.
2. Create another `docker-compose.yml` file with a differnt `container_name`. Then in the `docker exec daps daps -d DCFILE html` command, replace the first `daps` with the new `container_name`.
