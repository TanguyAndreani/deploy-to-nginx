FROM nginx

COPY content /usr/share/nginx/html
COPY conf/ /etc/nginx/

RUN mkdir -p /etc/nginx/sites-enabled/
RUN ln /etc/nginx/sites-available/default /etc/nginx/sites-enabled/