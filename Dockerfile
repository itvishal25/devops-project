FROM nginx:alpine

RUN apk upgrade --no-cache

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["sh","-c","exit 1"]
