#!/bin/bash
source "loader.sh"
docker-compose kill app
docker exec -it ${app}_db_1 bash -lc "psql --user=postgres -c 'drop database postgres'"
docker exec -it ${app}_db_1 bash -lc "psql --user=postgres -c 'create database postgres'"
docker-compose start app