#!/bin/bash
YELLOW='\033[0;33m'
NC='\033[0m'

def=config
mod=config_modify

echo -e "${YELLOW}Nginx${NC} diff files"
diff --color=always -w -u0 nginix/$def/nginx.conf nginix/$mod/nginx.conf

echo -e "${YELLOW}PHP${NC} diff files"
diff --color=always -w -u0 php/$def/php.ini php/$mod/php.ini

echo -e "${YELLOW}MySQL${NC} diff files"
diff --color=always -w -u0 mysql/$def/my.cnf mysql/$mod/my.cnf

echo -e "${YELLOW}Apache2${NC} diff files"
diff --color=always -w -u0 apache2/$def/apache2.conf apache2/$mod/apache2.conf

