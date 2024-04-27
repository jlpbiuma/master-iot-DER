CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(50),
    email VARCHAR(100),
    nombre_usuario VARCHAR(100),
    password VARCHAR(100)
);

CREATE TABLE Parcela (
    id_parcela INT PRIMARY KEY,
    nombre VARCHAR(50),
    ubicacion VARCHAR(100),
    id_propietario INT,
    FOREIGN KEY (id_propietario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Dispositivo (
    id_dispositivo INT PRIMARY KEY,
    nombre VARCHAR(50),
    estado VARCHAR(50),
    direccion_mac VARCHAR(50),
    direccion_ip VARCHAR(50),
    localizacion VARCHAR(100)
);

CREATE TABLE Sensor (
    id_sensor INT PRIMARY KEY,
    nombre VARCHAR(50),
    localizacion VARCHAR(100)
);


CREATE TABLE Unidad (
    id_unidad INT PRIMARY KEY,
    unidad VARCHAR(10),
    descripcion VARCHAR(50),
    escala VARCHAR(10)
    -- Otros campos relacionados con la unidad
);

CREATE TABLE Medida (
    id_medida INT PRIMARY KEY,
    id_unidad INT,
    valor DECIMAL,
    fecha TIMESTAMP,
    FOREIGN KEY (id_unidad) REFERENCES Unidad(id_unidad)
    -- Otros campos relacionados con la medida
);
-- Create relationships
CREATE TABLE usuario_parcelas (
    id_usuario INT,
    id_parcela INT,
    PRIMARY KEY (id_usuario, id_parcela),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_parcela) REFERENCES Parcela(id_parcela)
);


CREATE TABLE parcela_dispositivo (
    id_parcela INT,
    id_dispositivo INT,
    PRIMARY KEY (id_parcela, id_dispositivo),
    FOREIGN KEY (id_parcela) REFERENCES Parcela(id_parcela),
    FOREIGN KEY (id_dispositivo) REFERENCES Dispositivo(id_dispositivo)
);

CREATE TABLE dispositivo_sensores (
    id_dispositivo INT,
    id_sensor INT,
    PRIMARY KEY (id_dispositivo, id_sensor),
    FOREIGN KEY (id_dispositivo) REFERENCES Dispositivo(id_dispositivo),
    FOREIGN KEY (id_sensor) REFERENCES Sensor(id_sensor)
);

CREATE TABLE sensor_medidas (
    id_sensor INT,
    id_medida INT,
    PRIMARY KEY (id_sensor, id_medida),
    FOREIGN KEY (id_sensor) REFERENCES Sensor(id_sensor),
    FOREIGN KEY (id_medida) REFERENCES Medida(id_medida)
);

CREATE TABLE parcela_sensores (
    id_parcela INT,
    id_sensor INT,
    PRIMARY KEY (id_parcela, id_sensor),
    FOREIGN KEY (id_parcela) REFERENCES Parcela(id_parcela),
    FOREIGN KEY (id_sensor) REFERENCES Sensor(id_sensor)
);

CREATE TABLE parcela_unidades (
    id_parcela INT,
    id_unidad INT,
    PRIMARY KEY (id_parcela, id_unidad),
    FOREIGN KEY (id_parcela) REFERENCES Parcela(id_parcela),
    FOREIGN KEY (id_unidad) REFERENCES Unidad(id_unidad)
);