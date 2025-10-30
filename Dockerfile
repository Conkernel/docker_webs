FROM nginx:alpine

LABEL maintainer="oloco" \
      description="docker.web.casa.lan + crawler.web.casa.lan" \
      version="3.0"

# Instalar Node.js y PM2
RUN apk add --no-cache nodejs npm iproute2 && \
    npm install -g pm2

# Crear directorios
RUN mkdir -p /var/www /var/www/crawler

# Copiar archivos
COPY docker.sh /var/www/docker.sh
COPY crawler /var/www/crawler
COPY docker.web.casa.lan.conf /etc/nginx/conf.d/docker.web.casa.lan.conf
COPY crawler.web.casa.lan.conf /etc/nginx/conf.d/crawler.web.casa.lan.conf

# Eliminar default.conf
RUN rm -f /etc/nginx/conf.d/default.conf && \
    chmod 644 /var/www/docker.sh && \
    chown nginx:nginx /var/www/docker.sh

# Iniciar Node.js + Nginx
CMD sh -c "pm2 start /var/www/crawler/server.js --name crawler && nginx -g 'daemon off;'"

EXPOSE 80
EXPOSE 3000