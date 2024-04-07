# Логистическая платформа
## Поднятие сервера
Пересобрать проект (если необходимо):
```
docker-compose build
```

Запустить оркестр:
```
docker-compose run
```

## Данные для доступа
Порты:
- 8002 -- FastAPI
- 80 -- ReactJS
- 15432 -- pgAdmin 4
- 5432 -- postegres

Данные для БД:
- user: postgres
- password: postgres
- db: logistic

Данные для pgAdmin:
- email: admin@pgadmin.com
- password: 123456

