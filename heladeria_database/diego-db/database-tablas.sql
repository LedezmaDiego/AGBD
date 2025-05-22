CREATE TABLE gustos (
    gustos_id INTEGER NOT NULL PRIMARY KEY,
    gustos_name VARCHAR(255),
    gustos_esp_id INTEGER NOT NULL,
    FOREIGN KEY (gustos_esp_id) REFERENCES gustos_especiales(gustos_esp_id)
);

CREATE TABLE gustos_especiales(
    gustos_esp_id INTEGER NOT NULL PRIMARY KEY,
    gustos_esp_name VARCHAR(255)
);