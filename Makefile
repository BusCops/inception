DB_DATA=/home/abenzaho/data

COMPOSE_FILE=./srcs/docker-compose.yml

all : makedir up 

makedir:
	mkdir -p $(DB_DATA)/mariadb
	mkdir -p $(DB_DATA)/wordpress
	
up : makedir
	docker compose -f $(COMPOSE_FILE) up -d --build

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