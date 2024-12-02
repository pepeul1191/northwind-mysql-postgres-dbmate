# This repo is no longer maintained. Consider using `npm init vite` and selecting the `svelte` option or — if you want a full-fledged app framework — use [SvelteKit](https://kit.svelte.dev), the official application framework for Svelte.

---

### .env

Archivo <b>.env</b>

DB_MYSQL="mysql://root:root_password@127.0.0.1:3310/Mart_OLAP_Norhtwind"
DB_PG="postgres://myuser:mypassword@127.0.0.1:5433/Mart_OLAP_Norhtwind?sslmode=disable"

### Dockers

MySQL <b>docker-compose.yml</b>

```yml
version: '3.8'

services:
  db:
    image: mysql:8.0  # Puedes usar otra versión si lo prefieres
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root_password    # Cambia por una contraseña segura
      MYSQL_DATABASE: my_database             # Nombre de la base de datos inicial
      MYSQL_USER: my_user                      # Nombre de usuario
      MYSQL_PASSWORD: 123              # Contraseña del usuario
    ports:
      - "3310:3306"                            # Exponer el puerto para conexiones remotas
    volumes:
      - db_data:/var/lib/mysql                 # Persistencia de datos

volumes:
  db_data:
```

Postgres <b>docker-compose.yml</b>

```yml
version: '3.8'
services:
  postgres:
    image: postgres:13  # Puedes elegir la versión que necesites
    restart: always
    environment:
      POSTGRES_DB: mydatabase       # Nombre de la base de datos
      POSTGRES_USER: myuser         # Usuario de la base de datos
      POSTGRES_PASSWORD: mypassword # Contraseña del usuario
    volumes:
      - postgres_data:/var/lib/postgresql/data  # Persistencia de datos
    ports:
      - "5433:5432"  # Puertos de mapeo (host:container)

volumes:
  postgres_data:
    driver: local
```

### Migraciones

Migraciones con DBMATE - Mart_OLAP_Norhtwind - MySQL:

    $ npm run mysql:new <<nombre_de_migracion>>
    $ npm run mysql:up
    $ npm run mysql:rollback

Migraciones con DBMATE - Mart_OLAP_Norhtwind - Postgres:

    $ npm run pg:new <<nombre_de_migracion>>
    $ npm run pg:up
    $ npm run pg:rollback

---

Fuentes:

+ https://github.com/pepeul1191/flask-boilerplate-v2
+ https://www.pylint.org/#install
+ https://stackabuse.com/reading-and-writing-yaml-to-a-file-in-python/
+ https://github.com/pepeul1191/python-bottle-boilerplate


---

Fuentes:

+ https://github.com/codzsword/bootstrap-admin-dashboard/tree/main
+ https://www.youtube.com/watch?v=4VN8ZdDse9M