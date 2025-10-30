## Sirve una web crawler para buscar ficheros por nombre (http://elhacker.info) y sirve un script para instalar docker de forma automática usando curl y bash en Ubuntu 24


### Instrucciones:


``` bash
git clone https://github.com/Conkernel/docker_webs.git
cd docker_webs
docker compose up -d
```


``` bash
curl -sL http://docker.web.casa.lan
```

o

``` bash
docker run -d   --name gifted_liskov   -p 80:80  -p 3000:3000 oloco/web_crawler_and_docker

```
La otra web servida es http://crawler.web.casa.lan