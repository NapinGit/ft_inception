
NAME = inception

all: start

clean:
	@ docker-compose -f srcs/docker-compose.yaml down

fclean: clean
	@ docker system prune -f -a
	@ sudo rm -rf /home/aloiseau/data/websites
	@ sudo rm -rf /home/aloiseau/data/databases

start: 
	@ docker-compose -f srcs/docker-compose.yaml up -d --build


.PHONY: clean fclean prune reload all
