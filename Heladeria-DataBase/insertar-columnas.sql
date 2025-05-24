-- A la hora de ejecutar:
-- Cuando insertemos los datos en las tablas, si importa el orden
-- Aunque mandemos todos los INSERTS INTO al mismo tiempo
-- seguirá importando el orden

INSERT INTO gustos_especiales (gustos_exoticos_name)
VALUES ("Wasabi"),
("Queso azul"),
("Aceite de oliva"),
("Té verde matcha"),
("Cactus"),
("Pimienta rosa"),
("Albahaca"),
("Tomate cherry"),
("Curry"),
("Jengibre con miel"),
("Lavanda"),
("Rosa"),
("Sésamo negro"),
("Charcoal (carbón activado)"),
("Calabaza especiada"),
("Humo"),
("Cerveza artesanal"),
("Champán con frutilla"),
("Vino Malbec"),
("Ajo caramelizado"),
("Palta (aguacate)"),
("Anís estrellado"),
("Pepino con menta"),
("Pan de jengibre"),
("Tocino con maple"),
("Miso dulce"),
("Chili picante"),
("Café turco"),
("Blue cheese con peras"),
("Wasabi con chocolate blanco");

INSERT INTO salsas (salsa_name)
VALUES ("Salsa de frutilla"),
("Salsa de chocolate"),
("Salsa de dulce de leche"),
("Salsa de caramelo"),
("Salsa de frutos rojos"),
("Salsa de maracuyá"),
("Salsa de mango"),
("Salsa de kiwi"),
("Salsa de arándanos"),
("Salsa de limón"),
("Salsa de naranja"),
("Salsa de frambuesa"),
("Salsa de durazno"),
("Salsa de manzana verde"),
("Salsa de cereza"),
("Salsa de coco"),
("Salsa de frutos tropicales"),
("Salsa de lavanda"),
("Salsa de menta"),
("Salsa de café"),
("Salsa de vino tinto"),
("Salsa de ron con pasas"),
("Salsa de jengibre y miel"),
("Salsa de té verde"),
("Salsa de avellanas"),
("Salsa de pistacho"),
("Salsa de almendras"),
("Salsa de rosas"),
("Salsa de violetas"),
("Salsa de especias chai");

INSERT INTO bocadillos (bocadillos_name)
VALUES ("Obleas"),
("Chocolate KitKat"),
("Rocklets"),
("Chispas de chocolate"),
("Frutos secos"),
("Galletitas Oreo"),
("Brownie"),
("Galletitas de vainilla"),
("Cubitos de chocolate blanco"),
("Gomitas"),
("Nueces caramelizadas"),
("Crocante de maní"),
("Granas de colores"),
("Cereales"),
("Pedacitos de alfajor"),
("Cookies trozadas"),
("Marshmallows"),
("Trozos de banana"),
("Trozos de frutilla"),
("Coco rallado"),
("Caramelo duro"),
("Barra de cereal"),
("Churros en miniatura"),
("Turrón picado"),
("Bombones"),
("Confites de chocolate"),
("Mermelada espesa"),
("Bizcochuelo de chocolate"),
("Pedacitos de waffle"),
("Trozos de tarta de limón");

-- Inserta registros en la tabla 'store' con los nombres de las direcciones de las tiendas.
INSERT INTO store (address_name)
VALUES 
  ('Av. Leticia'); -- Dirección ficticia

-- Inserta registros en la tabla 'inventory' con el ID de la tienda.
INSERT INTO inventory (store_id)
VALUES
  (1); -- Solamente un ID, porque tenemos una tienda

-- Inserta dos registros en la tabla 'staff' con los nombres y las tiendas correspondientes.
INSERT INTO staff (first_name, last_name, store_id)
VALUES 
  ('Diego', 'Ajata Ledezma', 1), -- Agrega a Diego Ajata Ledezma asignado a la tienda con ID 1.
  ('Juanma', 'Parrado', 1);      -- Agrega a Juanma Parrado asignado a la tienda con ID 1. Porque solo hay una tienda

-- Insertar un inventario para cada tienda
INSERT INTO payment (pago, store_id, staff_id)
VALUES
  (3300, 1, 1),
  (6500, 1, 2),
  (3900, 1, 2),
  (7800, 1, 1),
  (2500, 1, 1),
  (3300, 1, 2),
  (4500, 1, 2),
  (1200, 1, 1);

INSERT INTO gustos (
  gustos_exoticos_id,
  salsa_id,
  gustos_name,
  bocadillos_id,
  inventory_id
) VALUES
(1, 1, 'Vainilla', 1, 1),
(2, 2, 'Chocolate', 2, 1),
(3, 3, 'Frutilla', 3, 1),
(4, 4, 'Crema del cielo', 4, 1),
(5, 5, 'Dulce de leche', 5, 1),
(6, 6, 'Frambuesa', 6, 1),
(7, 7, 'Limón', 7, 1),
(8, 8, 'Naranja', 8, 1),
(9, 9, 'Crema americana', 9, 1),
(10, 10, 'Banana', 10, 1),
(11, 11, 'Menta granizada', 11, 1),
(12, 12, 'Granizado', 12, 1),
(13, 13, 'Cereza', 13, 1),
(14, 14, 'Coco', 14, 1),
(15, 15, 'Mousse de chocolate', 15, 1),
(16, 16, 'Tiramisú', 16, 1),
(17, 17, 'Café', 17, 1),
(18, 18, 'Avellana', 18, 1),
(19, 19, 'Arándano', 19, 1),
(20, 20, 'Mousse de limón', 20, 1),
(21, 21, 'Zanahoria y naranja', 21, 1),
(22, 22, 'Durazno', 22, 1),
(23, 23, 'Manzana verde', 23, 1),
(24, 24, 'Leche merengada', 24, 1),
(25, 25, 'Mantecol', 25, 1),
(26, 26, 'Chantilly', 26, 1),
(27, 27, 'Yogur con frutas', 27, 1),
(28, 28, 'Maracuyá', 28, 1),
(29, 29, 'Uva', 29, 1),
(30, 30, 'Mora', 30, 1);