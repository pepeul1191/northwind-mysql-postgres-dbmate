# This repo is no longer maintained. Consider using `npm init vite` and selecting the `svelte` option or — if you want a full-fledged app framework — use [SvelteKit](https://kit.svelte.dev), the official application framework for Svelte.

---

### .env

Archivo <b>.env</b>

DB="sqlite:///db/demo.db"
ENV="local"||"server"
MAIL_PORT=465
MAIL_USER="xyz@gmail.com"
MAIL_PASS="asdfas"
MAIL_HOST="smtp.google.com"

### Migraciones

Migraciones con DBMATE - Mart_OLAP_Norhtwind - MySQL:

    $ npm run mysql:new <<nombre_de_migracion>>
    $ npm run mysql:up
    $ npm run mysql:rollback

Migraciones con DBMATE - Mart_OLAP_Norhtwind - Postgres:

    $ npm run postgres:new <<nombre_de_migracion>>
    $ npm run postgres:up
    $ npm run postgres:rollback

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