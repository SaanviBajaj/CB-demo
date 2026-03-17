FROM nginxinc/nginx-unprivileged:alpine

COPY . /usr/share/nginx/html/

RUN mv "/usr/share/nginx/html/CB Demo Web Page.html" /usr/share/nginx/html/index.html

EXPOSE 8080
