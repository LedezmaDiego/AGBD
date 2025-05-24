-- A la hora de ejecutar:
-- Para la creación de tablas no importa
-- el orden en el que sea puesto, siempre y cuando
-- absolutamente todo el codigo del archivo se coloque al mismo tiempo
-- o sea:
--< CREATE TABLE ...(
--   
--);
-- CREATE TABLE ...(
--   
--); >
-- Ejecutar todos los CREATE TABLE al mismo tiempo funciona


-- En la bash:
-- sqlite3 midatabase.db < tuarchivo.sql
-- Esto creará midatabase.db con todas las tablas,
-- datos e instrucciones que estaban en tuarchivo.sql.


CREATE TABLE gustos (
   gustos_id INTEGER PRIMARY KEY AUTOINCREMENT,
   gustos_exoticos_id INTEGER,
   salsa_id INTEGER,
   gustos_name TEXT NOT NULL,
   bocadillos_id INTEGER NOT NULL,
   inventory_id INTEGER NOT NULL,
   FOREIGN KEY(gustos_exoticos_id) REFERENCES gustos_especiales(gustos_exoticos_id),
   FOREIGN KEY(inventory_id) REFERENCES inventory(inventory_id),
   FOREIGN KEY(salsa_id) REFERENCES salsas(salsa_id),
   FOREIGN KEY(bocadillos_id) REFERENCES bocadillos(bocadillos_id)
);

CREATE TABLE gustos_especiales (
   gustos_exoticos_id INTEGER PRIMARY KEY AUTOINCREMENT,
   gustos_exoticos_name TEXT NOT NULL
);

CREATE TABLE salsas (
   salsa_id INTEGER PRIMARY KEY AUTOINCREMENT,
   salsa_name TEXT NOT NULL
);

CREATE TABLE bocadillos (
   bocadillos_id INTEGER PRIMARY KEY AUTOINCREMENT,
   bocadillos_name TEXT NOT NULL
);

CREATE TABLE inventory (
   inventory_id INTEGER PRIMARY KEY AUTOINCREMENT,
   store_id INTEGER,
   FOREIGN KEY(store_id) REFERENCES store(store_id)
);

CREATE TABLE store (
   store_id INTEGER PRIMARY KEY AUTOINCREMENT,
   address_name TEXT NOT NULL
);

CREATE TABLE staff (
   staff_id INTEGER PRIMARY KEY AUTOINCREMENT,
   first_name TEXT NOT NULL,
   last_name TEXT NOT NULL,
   store_id INTEGER,
   FOREIGN KEY(store_id) REFERENCES store(store_id)
);

CREATE TABLE payment (
   payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
   pago INTEGER,
   store_id INTEGER NOT NULL,
   staff_id INTEGER NOT NULL,
   FOREIGN KEY(store_id) REFERENCES store(store_id),
   FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
);