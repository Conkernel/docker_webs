# Sirve una web crawler para buscar ficheros por nombre (http://elhacker.info) y sirve un script para instalar docker de forma auomática usando curl y bash en Ubuntu 24


## Instrucciones:

``` bash
docker login -u oloco

docker run -d oloco/web_crawler_and_docker
```
o

``` bash
git clone https://github.com/Conkernel/docker_webs.git
cd docker_webs
docker compose up -d
```


``` bash
curl -sL http://docker.web.casa.lan
```

La otra web servida es http://crawler.web.casa.lan