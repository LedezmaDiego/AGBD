INSERT INTO tiendas (direccion)
VALUES ('Av. Leticia');

INSERT INTO especiales (nombre_especial, tienda_id)
VALUES ("Tramontana", 1), ("Flan", 1);

INSERT INTO salsas (nombre_salsa)
VALUES ("Salsa de Frutilla"),
("Salsa de Chocolate"),
("Salsa de Dulce de Leche"),
("Salsa de Caramelo"),
("Salsa de Frutos Rojos");

INSERT INTO bocadillos (nombre_bocadillo)
VALUES ("Obleas"),
("Chocolate KitKat"),
("Rocklets"),
("Chispas de Chocolate"),
("Galletitas Oreo"),
("Brownie"),
("Galletitas de Vainilla"),
("Cubitos de Chocolate Blanco"),
("Gomitas"),
("Cereales"),
("Pedacitos de Alfajor"),
("Trozos de Banana"),
("Trozos de Frutilla"),
("Barra de Cereal"),
("Turrón Picado"),
("Bombones"),
("Confites de Chocolate"),
("Bizcochuelo de Chocolate"),
("Pedacitos de Waffle"),
("Trozos de Tarta de Limón");

INSERT INTO sabores (nombre_sabor, tienda_id)
VALUES
('Vainilla', 1),
('Chocolate', 1),
('Frutilla', 1),
('Dulce de Leche', 1),
('Frambuesa', 1),
('Limón', 1),
('Banana Split', 1),
('Granizado', 1),
('Tiramisú', 1),
('Durazno', 1);

INSERT INTO cucuruchos (nombre_cucurucho)
VALUES
('Cucurucho Simple'),
('Cucurucho Doble'),
('Capelina'),
('Pote de 1/4Kg'),
('Pote de 1/2Kg'),
('Pote de 1Kg');

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
CROSS JOIN especiales e;

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
CROSS JOIN salsas sa;

INSERT INTO inter_especial_bocadillo (especial_id, bocadillo_id)
SELECT e.especial_id, b.bocadillo_id
FROM especiales e
CROSS JOIN bocadillos b;

INSERT INTO inter_cucurucho_sabor (cucurucho_id, sabor_id)
SELECT c.cucurucho_id, s.sabor_id
FROM sabores s
CROSS JOIN cucuruchos c;

INSERT INTO inter_cucurucho_especial (cucurucho_id, especial_id)
SELECT c.cucurucho_id, e.especial_id
FROM especiales e
CROSS JOIN cucuruchos c;

/*
Ejemplos de pedidos:

Este es un pedido muy grande:
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

1) Pedido de un kilo de Banana Split con Dulce de Leche en pote:
SELECT s.nombre_sabor AS "Sabor", c.nombre_cucurucho AS "Cucurucho"
FROM sabores s
CROSS JOIN cucuruchos c
WHERE s.nombre_sabor IN ('Banana Split', 'Dulce de Leche')
AND c.nombre_cucurucho = 'Pote de 1Kg';

2) Total vendido por cada empleado:
SELECT e.nombre_empleado, e.apellido_empleado, SUM(p.monto) AS total_vendido
FROM pagos p
INNER JOIN empleados e ON p.empleado_id = e.empleado_id
GROUP BY e.empleado_id;

3) Todos los sabores disponibles en la tienda:
SELECT s.sabor_id, s.nombre_sabor
FROM sabores s
WHERE s.tienda_id = 1;

4) Pedido de una capelina con tramontana, salsa de chocolate y rocklets
SELECT 
  e.nombre_especial AS "Especial",
  sa.nombre_salsa AS "Salsa",
  b.nombre_bocadillo AS "Bocadillo",
  c.nombre_cucurucho AS "Cucurucho"
FROM especiales e
INNER JOIN inter_especial_salsa iesa ON iesa.especial_id = e.especial_id
INNER JOIN salsas sa ON sa.salsa_id = iesa.salsa_id
INNER JOIN inter_especial_bocadillo ieb ON ieb.especial_id = e.especial_id
INNER JOIN bocadillos b ON b.bocadillo_id = ieb.bocadillo_id
INNER JOIN inter_cucurucho_especial ice ON ice.especial_id = e.especial_id
INNER JOIN cucuruchos c ON c.cucurucho_id = ice.cucurucho_id
WHERE e.nombre_especial = 'Tramontana'
  AND sa.nombre_salsa = 'Salsa de Chocolate'
  AND b.nombre_bocadillo = 'Rocklets'
  AND c.nombre_cucurucho = 'Capelina';
*/