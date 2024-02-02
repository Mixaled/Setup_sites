server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html/site-2.ru;
    index tinyfilemanager.php index.php;
    client_max_body_size 64M;

    server_name site-2.ru;

    location / {
        try_files $uri $uri/ =404;
    }

    location /phpmyadmin/ {
        alias /var/www/html/site-2.ru/phpmyadmin/;
        location ~ \.php$ {
            include fastcgi_params;
            fastcgi_pass unix:/run/php/php8.1-fpm-site-2.sock;
            fastcgi_param SCRIPT_FILENAME $request_filename;
        }
    }

	location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.1-fpm-site-2.sock;
    }
	location ~ \.php$ {
    	include fastcgi_params;
    	fastcgi_pass unix:/var/run/php/php7.4-fpm-site-2.sock;
    	fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
	}
}
