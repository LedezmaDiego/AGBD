-- 1 Hay 30 canciones.
SELECT COUNT(*) AS cantidad_canciones
FROM tracks
JOIN albums ON tracks.AlbumId = albums.AlbumId
WHERE albums.Title = 'Unplugged';

-- 2
SELECT artists.Name AS artista, COUNT(tracks.TrackId) AS cantidad_canciones
FROM artists
JOIN albums ON artists.ArtistId = albums.ArtistId
JOIN tracks ON albums.AlbumId = tracks.AlbumId
GROUP BY artists.ArtistId
HAVING COUNT(tracks.TrackId) >= 30
ORDER BY cantidad_canciones DESC;

-- 3
INSERT INTO tracks (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
VALUES (3504, 'Elementales Leches', 1, 1, 1, 'Luis Alberto Spinetta', 256200, 5000000, 0.99),
(3505, 'Parlante', 1, 1, 9, 'Luis Alberto Spinetta', 191400, 5000000, 0.99),
(3506, 'Castillo de Piedra', 1, 1, 1, 'Luis Alberto Spinetta', 190800, 5000000, 0.99),
(3507, 'Cantata de Puentes Amarillos', 1, 1, 1, 'Luis Alberto Spinetta', 547200, 5000000, 0.99),
(3508, 'Las Habladurias del Mundo', 1, 1, 9, 'Luis Alberto Spinetta', 243600, 5000000, 0.99),
(3509, 'Post-Crucifixion', 1, 1, 9, 'Luis Alberto Spinetta', 210000, 5000000, 0.99);

-- 4
UPDATE tracks
SET Name = 'Fermín'
WHERE Name = 'Parlante';
UPDATE tracks
SET Milliseconds = 190200
WHERE Name = 'Fermín';

-- 5
DELETE FROM tracks WHERE Name IN ('Castillo de Piedra', 'Las Habladurias del Mundo');
