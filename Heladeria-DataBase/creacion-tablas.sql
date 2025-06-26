CREATE TABLE sabores (
   sabor_id INTEGER PRIMARY KEY AUTOINCREMENT,
   nombre_sabor TEXT NOT NULL,
   tienda_id INTEGER,
   FOREIGN KEY(tienda_id) REFERENCES tiendas(tienda_id)
);

CREATE TABLE especiales (
   especial_id INTEGER PRIMARY KEY AUTOINCREMENT,
   nombre_especial TEXT NOT NULL,
   tienda_id INTEGER,
   FOREIGN KEY(tienda_id) REFERENCES tiendas(tienda_id)
);

CREATE TABLE salsas (
   salsa_id INTEGER PRIMARY KEY AUTOINCREMENT,
   nombre_salsa TEXT NOT NULL
);

CREATE TABLE bocadillos (
   bocadillo_id INTEGER PRIMARY KEY AUTOINCREMENT,
   nombre_bocadillo TEXT NOT NULL
);

CREATE TABLE tiendas (
   tienda_id INTEGER PRIMARY KEY AUTOINCREMENT,
   direccion TEXT NOT NULL
);

CREATE TABLE empleados (
   empleado_id INTEGER PRIMARY KEY AUTOINCREMENT,
   nombre_empleado TEXT NOT NULL,
   apellido_empleado TEXT NOT NULL,
   tienda_id INTEGER,
   FOREIGN KEY(tienda_id) REFERENCES tiendas(tienda_id)
);

CREATE TABLE pagos (
   pago_id INTEGER PRIMARY KEY AUTOINCREMENT,
   monto INTEGER,
   tienda_id INTEGER,
   empleado_id INTEGER,
   FOREIGN KEY(tienda_id) REFERENCES tiendas(tienda_id),
   FOREIGN KEY(empleado_id) REFERENCES empleados(empleado_id)
);

CREATE TABLE cucuruchos (
   cucurucho_id INTEGER PRIMARY KEY AUTOINCREMENT,
   nombre_cucurucho TEXT,
   precio INTEGER
);

CREATE TABLE inter_sabor_especial (
   sabor_id INTEGER,
   especial_id INTEGER,
   PRIMARY KEY (sabor_id, especial_id),
   FOREIGN KEY (sabor_id) REFERENCES sabores(sabor_id) ON DELETE CASCADE,
   FOREIGN KEY (especial_id) REFERENCES especiales(especial_id) ON DELETE CASCADE
);

CREATE TABLE inter_sabor_salsa (
   sabor_id INTEGER,
   salsa_id INTEGER,
   PRIMARY KEY (sabor_id, salsa_id),
   FOREIGN KEY (sabor_id) REFERENCES sabores(sabor_id) ON DELETE CASCADE,
   FOREIGN KEY (salsa_id) REFERENCES salsas(salsa_id) ON DELETE CASCADE
);

CREATE TABLE inter_sabor_bocadillo (
   sabor_id INTEGER,
   bocadillo_id INTEGER,
   PRIMARY KEY (sabor_id, bocadillo_id),
   FOREIGN KEY (sabor_id) REFERENCES sabores(sabor_id) ON DELETE CASCADE,
   FOREIGN KEY (bocadillo_id) REFERENCES bocadillos(bocadillo_id) ON DELETE CASCADE
);

CREATE TABLE inter_especial_salsa (
   especial_id INTEGER,
   salsa_id INTEGER,
   PRIMARY KEY (especial_id, salsa_id),
   FOREIGN KEY (especial_id) REFERENCES especiales(especial_id) ON DELETE CASCADE,
   FOREIGN KEY (salsa_id) REFERENCES salsas(salsa_id) ON DELETE CASCADE
);

CREATE TABLE inter_especial_bocadillo (
   especial_id INTEGER,
   bocadillo_id INTEGER,
   PRIMARY KEY (especial_id, bocadillo_id),
   FOREIGN KEY (especial_id) REFERENCES especiales(especial_id) ON DELETE CASCADE,
   FOREIGN KEY (bocadillo_id) REFERENCES bocadillos(bocadillo_id) ON DELETE CASCADE
);

CREATE TABLE inter_cucurucho_sabor (
   cucurucho_id INTEGER,
   sabor_id INTEGER,
   PRIMARY KEY (cucurucho_id, sabor_id),
   FOREIGN KEY (cucurucho_id) REFERENCES cucuruchos(cucurucho_id) ON DELETE CASCADE,
   FOREIGN KEY (sabor_id) REFERENCES sabores(sabor_id) ON DELETE CASCADE
);

CREATE TABLE inter_cucurucho_especial (
   cucurucho_id INTEGER,
   especial_id INTEGER,
   PRIMARY KEY (cucurucho_id, especial_id),
   FOREIGN KEY (cucurucho_id) REFERENCES cucuruchos(cucurucho_id) ON DELETE CASCADE,
   FOREIGN KEY (especial_id) REFERENCES especiales(especial_id) ON DELETE CASCADE
);