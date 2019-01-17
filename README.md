# Environment of clojure project 

```
    [+] AUTOR:        Gerardo Junior
    [+] SITE:         https://gerardo-junior.com
    [+] EMAIL:        me@gerardo-junior.com
    [+] GITHUB:       https://github.com/gerardo-junior/clojure-docker.git
    [+] TELEGRAM:     @MrGerardoJunior
```

[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/gerardojunior/clojure)

Docker image to run [clojure](https://clojure.org/) projects

> The project must be in the **/src** container folder 
## Tags available

- [stable](https://github.com/gerardo-junior/clojure-docker/blob/master/Dockerfile), [latest](https://github.com/gerardo-junior/clojure-docker/blob/develop/Dockerfile), [1.0.0](https://github.com/gerardo-junior/clojure-docker/blob/1.0.0/Dockerfile)
  - [leiningen](https://leiningen.org/) 2.8.3
  - [openjdk](https://openjdk.java.net/) 8

## Come on, do your tests

```bash
docker pull gerardojunior/clojure:stable
```

## How to build

to build the image you need install the [docker engine](https://www.docker.com/) only

> You can try building with different versions of software with docker args, for example: LEIN_VERSION=2.8.3

```bash
docker build https://github.com/gerardo-junior/clojure-docker.git --tag gerardojunior/clojure
```

## How to use

##### Only with docker command:

```bash
# in your project folder
docker run -it --rm -v $(pwd):/src gerardojunior/clojure:stable [command]

# or docker-compose
docker-compose run clojure [command]
```
##### With [docker-compose](https://docs.docker.com/compose/)

Create the docker-compose.yml file  in your project folder with:

```yml
# (...)

  clojure:
    image: gerardojunior/clojure:stable
    restart: on-failure
    volumes:
      - type: bind
        source: ./
        target: /src

# (...)
```

## How to enter image shell
 
```bash
docker run -it --rm gerardojunior/clojure sh
# or with docker-compose
docker-compose run clojure sh
```

### License  
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
