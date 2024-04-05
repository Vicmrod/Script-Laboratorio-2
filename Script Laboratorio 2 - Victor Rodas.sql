-- Desnormalización de la Moneda en la tabla Pais
CREATE TABLE Moneda(
    Id SERIAL PRIMARY KEY,
	Moneda VARCHAR(50) NOT NULL,
	Sigla VARCHAR(100) NOT NULL,
	Imagen BYTEA NULL
);

ALTER TABLE Pais
ADD Moneda VARCHAR(30) NULL;

UPDATE Pais
SET Moneda = Moneda.Id FROM Moneda;
UPDATE Pais
SET Moneda = (
    SELECT Moneda
    FROM Pais AS P
    WHERE P.Id = Pais.Id
);


-- Agregar campos para imágenes del Mapa y la Bandera del País
ALTER TABLE Pais
ADD COLUMN MapaImagen BYTEA NULL,
ADD COLUMN BanderaImagen BYTEA NULL;

-- Actualizar las imágenes de Mapa y Bandera del País
UPDATE Pais
SET MapaImagen = 'imagen_mapa.jpg',
BanderaImagen = 'imagen_bandera.jpg'
WHERE Id = 9; -- Asumiendo que el País es Chile