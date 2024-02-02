server {
    listen 80;
    server_name site.ru www.site.ru;

    root /var/www/html/site.ru;
    index index.php;

    #location / {
    #    proxy_pass http://127.0.0.1:8080;
    #    proxy_set_header Host $host;
    #    proxy_set_header X-Real-IP $remote_addr;
    #    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    #}

    location / {
        proxy_pass http://127.0.0.1:81;  # Порт Apache2
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ {
        expires 30d;
        add_header Cache-Control "public, max-age=2592000";
        proxy_pass http://127.0.0.1:80;  # Порт Nginx
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.1-fpm.sock;
    }

}
