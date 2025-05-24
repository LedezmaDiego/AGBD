SELECT * FROM INHABITANT

SELECT * FROM inhabitant WHERE job = 'butcher'

SELECT * FROM INHABITANT WHERE state = 'friendly'

SELECT * FROM INHABITANT WHERE job = 'weaponsmith' AND state = 'friendly';

SELECT * FROM INHABITANT WHERE job LIKE '%smith' AND state = 'friendly';

SELECT personid FROM INHABITANT WHERE name = 'Stranger'

SELECT gold FROM INHABITANT WHERE name = 'Stranger'

SELECT * FROM ITEM WHERE owner IS NULL

SELECT * FROM ITEM WHERE owner = 20

SELECT * FROM INHABITANT WHERE (job = 'dealer' OR job = 'merchant') AND state = 'friendly'

UPDATE ITEM SET owner = 15 WHERE item = 'ring' OR item = 'teapot'

-- No se el porqué, pero cuando utilizan "UPDATE", colocan el nombre de la tabla en minusculas
-- Así que lo colocare en mayusculas hasta que se me aclare el porqué
UPDATE INHABITANT SET gold = gold + 120 WHERE personid = 20

UPDATE INHABITANT SET name = "Papu" WHERE personid = 20

SELECT * FROM inhabitant WHERE job = "baker" ORDER BY gold DESC

SELECT * FROM inhabitant WHERE job = "pilot"

-- Esteeee
SELECT v.name FROM VILLAGE v INNER JOIN INHABITANT i ON v.villageid = i.villageid WHERE i.name = 'Dirty Dieter'
SELECT village.name FROM village, inhabitant WHERE village.villageid = inhabitant.villageid AND inhabitant.name = 'Dirty Dieter'

SELECT inhabitant.name FROM VILLAGE INNER JOIN INHABITANT ON village.chief = inhabitant.personid WHERE village.name = 'Onionville'
SELECT inhabitant.name FROM VILLAGE, INHABITANT WHERE village.chief = inhabitant.personid AND village.name = "Onionville"

SELECT COUNT(*) FROM inhabitant, village WHERE village.villageid = inhabitant.villageid AND village.name = 'Onionville'

SELECT COUNT(*) FROM INHABITANT WHERE gender = 'f' and villageid = 3

SELECT name FROM INHABITANT WHERE gender = 'f' and villageid = 3

SELECT SUM(i.gold) FROM VILLAGE v INNER JOIN INHABITANT i ON v.villageid = i.villageid WHERE v.name = 'Cucumbertown'
SELECT SUM(inhabitant.gold) FROM inhabitant, village WHERE village.villageid = inhabitant.villageid AND village.name = 'Cucumbertown'

SELECT SUM(inhabitant.gold) FROM INHABITANT WHERE job = "baker" OR job = "dealer" OR job = "merchant"

SELECT job, SUM(inhabitant.gold), AVG(inhabitant.gold) FROM inhabitant GROUP BY job ORDER BY AVG(inhabitant.gold)

SELECT state, AVG(inhabitant.gold) FROM INHABITANT GROUP BY state ORDER BY AVG(inhabitant.gold)
