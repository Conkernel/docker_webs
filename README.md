## Sirve una web crawler para buscar ficheros por nombre (http://elhacker.info) y sirve un script para instalar docker de forma automática usando curl y bash en Ubuntu 24


## Instrucciones:


``` bash
git clone https://github.com/Conkernel/docker_webs.git
cd docker_webs
docker compose up -d
```

o

``` bash
docker run -d --name docker_webs -p 80:80 -p 3000:3000 oloco/web_crawler_and_docker

```

## Luego...

## Instalar docker en Ubuntu:
``` bash
curl -sL http://docker.web.casa.lan | sudo bash
```

## Instalar zsh + Powerlevel10k en Ubuntu:
``` bash
curl -sL http://zsh.web.casa.lan | sudo bash
```


La otra web servida es http://crawler.web.casa.lan, que ejecuta una web en node.js para hacer un crawling en la web de elhacker.info