FROM nginx:alpine

# ... [Resto de LABEL, etc.] ...

# Instalar Node.js, NPM y PM2 (pm2 puede ser global, pero otras dependencias no)
RUN apk add --no-cache nodejs npm iproute2 && \
    npm install -g pm2

# 1. Establecer el directorio de trabajo
WORKDIR /var/www/crawler

# 2. Copiar solo los archivos de manifiesto para aprovechar el cache.
# Si package.json/package-lock.json no cambian, Docker no reinstala node_modules.
COPY crawler/package*.json ./

# 3. Instalar dependencias locales (¡Esto es lo que faltaba!)
# Se ejecuta dentro de /var/www/crawler, donde está package.json
RUN npm install

# 4. Copiar el resto de los archivos de tu proyecto
COPY crawler .
COPY zsh .
# ...
# Copiar archivos restantes y configuraciones de Nginx

COPY docker.sh /var/www/docker.sh
COPY zsh /var/www/zsh/
COPY docker.web.casa.lan.conf /etc/nginx/conf.d/docker.web.casa.lan.conf
COPY crawler.web.casa.lan.conf /etc/nginx/conf.d/crawler.web.casa.lan.conf
COPY zsh.web.casa.lan.conf /etc/nginx/conf.d/zsh.web.casa.lan.conf

# Eliminar default.conf
RUN rm -f /etc/nginx/conf.d/default.conf && \
    chmod 644 /var/www/docker.sh && \
    chown nginx:nginx /var/www/docker.sh


RUN mkdir -p /var/log/pm2 && chown nginx:nginx /var/log/pm2
# Iniciar Node.js + Nginx

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


EXPOSE 80
EXPOSE 3000