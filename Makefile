help:
	@echo 'Opciones:'
	@echo ''
	@echo 'start | stop | restart | stop-all'
	@echo 'stats | logs | workspace | sqlplus'
	@echo 'clean'

start:
	@docker-compose up -d --remove-orphans

stop:
	@docker-compose stop

restart: stop start

stop-all:
	@docker stop `docker ps -aq`

stats:
	@docker stats

logs:
	@docker-compose logs server

workspace:
	@docker-compose exec server /bin/bash

sqlplus:
	@docker-compose exec server sqlplus / as sysdba

clean:
	@docker-compose down -v --remove-orphans
