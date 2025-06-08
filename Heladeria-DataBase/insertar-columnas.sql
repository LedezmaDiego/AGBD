INSERT INTO especiales (nombre_especial, tienda_id)
VALUES ("Tramontana", 1), ("Flan", 1);

INSERT INTO salsas (nombre_salsa)
VALUES ("Salsa de frutilla"),
("Salsa de chocolate"),
("Salsa de dulce de leche"),
("Salsa de caramelo"),
("Salsa de frutos rojos");

INSERT INTO bocadillos (nombre_bocadillo)
VALUES ("Obleas"),
("Chocolate KitKat"),
("Rocklets"),
("Chispas de chocolate"),
("Galletitas Oreo"),
("Brownie"),
("Galletitas de vainilla"),
("Cubitos de chocolate blanco"),
("Gomitas"),
("Cereales"),
("Pedacitos de alfajor"),
("Cookies trozadas"),
("Trozos de banana"),
("Trozos de frutilla"),
("Barra de cereal"),
("Turrón picado"),
("Bombones"),
("Confites de chocolate"),
("Bizcochuelo de chocolate"),
("Pedacitos de waffle"),
("Trozos de tarta de limón");

INSERT INTO sabores (nombre_sabor, tienda_id)
VALUES
('Vainilla', 1),
('Chocolate', 1),
('Frutilla', 1),
('Dulce de leche', 1),
('Frambuesa', 1),
('Limón', 1),
('Banana split', 1),
('Granizado', 1),
('Tiramisú', 1),
('Durazno', 1);

INSERT INTO cucuruchos (nombre_cucurucho)
VALUES
('Cucurucho simple'),
('Cucurucho doble'),
('Capelina'),
('Pote de 1/4kg'),
('Pote de 1/2kg'),
('Pote de 1kg');

INSERT INTO tienda (direccion)
VALUES ('Av. Leticia');

INSERT INTO empleados (nombre_empleado, apellido_empleado, tienda_id)
VALUES 
  ('Diego', 'Ajata Ledezma', 1),
  ('Juanma', 'Parrado', 1);

INSERT INTO pagos (monto, tienda_id, empleado_id)
VALUES
  (3300, 1, 1),
  (6500, 1, 2),
  (3900, 1, 2),
  (7800, 1, 1),
  (2500, 1, 1),
  (3300, 1, 2),
  (4500, 1, 2),
  (1200, 1, 1);

INSERT INTO inter_sabor_especial (sabor_id, especial_id)
SELECT s.sabor_id, e.especial_id
FROM sabores s
CROSS JOIN especiales e

INSERT INTO inter_sabor_salsa (sabor_id, salsa_id)
SELECT s.sabor_id, sa.salsa_id
FROM sabores s
CROSS JOIN salsas sa;

INSERT INTO inter_sabor_bocadillo (sabor_id, bocadillo_id)
SELECT s.sabor_id, b.bocadillo_id
FROM sabores s
CROSS JOIN bocadillos b;

INSERT INTO inter_especial_salsa (especial_id, salsa_id)
SELECT e.especial_id, sa.salsa_id
FROM especiales e
CROSS JOIN salsas sa

INSERT INTO inter_especial_bocadillo (especial_id, bocadillo_id)
SELECT e.especial_id, b.bocadillo_id
FROM especiales e
CROSS JOIN bocadillos b

INSERT INTO inter_cucurucho_sabor (cucurucho_id, sabor_id)
SELECT c.cucurucho_id, s.sabor_id
FROM sabores s
CROSS JOIN cucuruchos c

INSERT INTO inter_cucurucho_especial (cucurucho_id, especial_id)
SELECT c.cucurucho_id, e.especial_id
FROM especiales e
CROSS JOIN cucuruchos c

/*
Ejemplos de pedidos:

SELECT s.nombre_sabor AS "Sabor", e.nombre_especial AS "Sabor Especial", sa.nombre_salsa AS "Salsa", b.nombre_bocadillo AS "Bocadillo", c.nombre_cucurucho AS "Tipo de Cucurucho" FROM sabores s
INNER JOIN inter_sabor_especial i_s_e ON i_s_e.sabor_id = s.sabor_id
INNER JOIN especiales e ON e.especial_id = i_s_e.especial_id
INNER JOIN inter_especial_salsa i_e_sa ON i_e_sa.especial_id = e.especial_id
INNER JOIN salsas sa ON sa.salsa_id = i_e_sa.salsa_id
INNER JOIN inter_sabor_bocadillo i_s_b ON i_s_b.sabor_id = s.sabor_id
INNER JOIN bocadillos b ON b.bocadillo_id = i_s_b.bocadillo_id
INNER JOIN inter_cucurucho_especial icu ON icu.especial_id = e.especial_id
INNER JOIN cucuruchos c ON c.cucurucho_id = icu.cucurucho_id
WHERE s.sabor_id = 1 AND e.especial_id = 2 AND sa.salsa_id = 5 AND b.bocadillo_id = 3 AND c.cucurucho_id = 2

SELECT s.nombre_sabor, sa.nombre_salsa, b.nombre_bocadillo
FROM sabores s
INNER JOIN inter_sabor_salsa iesa ON iesa.sabor_id = s.sabor_id
INNER JOIN salsas sa ON sa.salsa_id = iesa.salsa_id
INNER JOIN inter_sabor_bocadillo isb ON isb.sabor_id = s.sabor_id
INNER JOIN bocadillos b ON b.bocadillo_id = isb.bocadillo_id
WHERE s.sabor_id = 1;
*/