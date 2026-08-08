DB_DATA=/home/abenzaho/data

COMPOSE_FILE=./srcs/docker-compose.yml

ENV_FILE=./srcs/.env

all : up

up : makedir domain
	docker compose -f $(COMPOSE_FILE) up -d --build

makedir: 
	mkdir -p $(DB_DATA)/mariadb
	mkdir -p $(DB_DATA)/wordpress

domain : $(ENV_FILE)  
	sudo sh -c 'echo "127.0.0.1 $$(grep "^DOMAIN_NAME=" $(ENV_FILE) | cut -d= -f2)\n127.0.0.1 localhost" > /etc/hosts'
down :
	docker compose -f $(COMPOSE_FILE) down

clean :
	docker compose -f $(COMPOSE_FILE) down -v

fclean :
	docker compose -f $(COMPOSE_FILE) down -v --rmi all
	sudo rm -rf $(DB_DATA)/mariadb
	sudo rm -rf $(DB_DATA)/wordpress

status :
	docker compose -f $(COMPOSE_FILE) ps

logs :
	docker compose -f $(COMPOSE_FILE) logs -f
re : fclean all

.PHONY : all makedir up down clean fclean re