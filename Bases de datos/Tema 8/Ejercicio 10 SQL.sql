DROP SCHEMA IF EXISTS AEROPUERTO;

CREATE SCHEMA AEROPUERTO;

USE AEROPUERTO;

CREATE TABLE AEROPUERTO (
    ID INT PRIMARY KEY AUTO_INCREMENT, 
    NOMBRE VARCHAR(20) UNIQUE, 
    CIUDAD VARCHAR(50), 
    PAÍS VARCHAR(50) 
);

CREATE TABLE PROGRAMA_VUELO (
    ID INT AUTO_INCREMENT, 
    LÍNEA VARCHAR(50), 
    ID_DESPEGA INT, 
    ID_ATERRIZA INT,

    PRIMARY KEY(ID, ID_DESPEGA, ID_ATERRIZA),

    FOREIGN KEY (ID_DESPEGA) REFERENCES AEROPUERTO(ID),
    FOREIGN KEY (ID_ATERRIZA) REFERENCES AEROPUERTO(ID)
);

CREATE TABLE PROGRAMA_VUELA_DÍAS (
    ID_PROGRAMA INT, 
    DÍA_SEMANA VARCHAR(50) PRIMARY KEY,
    
        CONSTRAINT SEMANA CHECK (DÍA_SEMANA IN ("LUNES","MARTES","MIÉRCOLES","JUEVES","VIERNES","SÁBADO","DOMINGO"))

);

CREATE TABLE MODELO_AVIÓN (
    ID INT PRIMARY KEY AUTO_INCREMENT, 
    LONGITUD_METROS DECIMAL CHECK(LONGITUD_METROS >= 0), 
    ANCHO_METROS DECIMAL CHECK(ANCHO_METROS >= 0), 
    NÚMERO_PLAZAS INT DEFAULT '50'
);

CREATE TABLE VUELO (
    ID INT PRIMARY KEY AUTO_INCREMENT, 
    NÚMERO_VUELO INT, 
    MATRÍCULA VARCHAR(9) NOT NULL,
    HORA_DESPEGUE TIME,
    HORA_ATERRIZAJE TIME, 
    ID_PROGRAMA INT, 
    ID_MODELO INT,

    FOREIGN KEY (ID_PROGRAMA) REFERENCES PROGRAMA_VUELO(ID), 
    FOREIGN KEY (ID_MODELO) REFERENCES MODELO_AVIÓN(ID)
);

CREATE TABLE MODELO_PUEDE_ATERRIZAR_AEROPUERTO (
    ID_MODELO INT, 
    ID_AEROPUERTO INT,

    PRIMARY KEY (ID_MODELO,ID_AEROPUERTO),

    FOREIGN KEY (ID_MODELO) REFERENCES MODELO_AVIÓN(ID),
    FOREIGN KEY (ID_AEROPUERTO) REFERENCES AEROPUERTO(ID)
);
