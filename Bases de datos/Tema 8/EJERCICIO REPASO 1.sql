DROP SCHEMA IF EXISTS CAMIONES;

CREATE SCHEMA CAMIONES;

USE CAMIONES;

CREATE TABLE CAMIONERO (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    DNI VARCHAR(8) ,
    NOMBRE TINYTEXT,
    TELEFONO INT(9),
    DIRECCION VARCHAR(40),
    SALARIO DECIMAL(8, 2),
    POBLACION TINYTEXT
);

CREATE TABLE CAMION (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    MATRICULA VARCHAR(10),
    MODELO VARCHAR(20),
    TIPO VARCHAR(20),
    POTENCIA INT
);

CREATE TABLE PAQUETE (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CODIGO VARCHAR(10),
    DESCRIPCION TINYTEXT,
    NOMBRE_DESTINATARIO TINYTEXT,
    DIRECCION_DESTINATARIO VARCHAR(40),
    ID_PROVINCIA INT,
    FOREIGN KEY (ID_PROVINCIA) REFERENCES PROVINCIA(ID)
);

CREATE TABLE PROVINCIA (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CODIGO VARCHAR(10),
    NOMBRE VARCHAR(20)
);

CREATE TABLE CAMIONERO_CONDUCE_CAMION (
    ID_CAMIONERO INT,
    ID_CAMION INT,
    FECHA DATE,
    PRIMARY KEY (ID_CAMIONERO, ID_CAMION,FECHA),
    FOREIGN KEY (ID_CAMIONERO) REFERENCES CAMIONERO(ID),
    FOREIGN KEY (ID_CAMION) REFERENCES CAMION(ID)
);

CREATE TABLE CAMIONERO_TRANSPORTA_PAQUETE (
    ID_CAMIONERO INT,
    ID_PAQUETE INT,
    PRIMARY KEY (ID_CAMIONERO, ID_PAQUETE),
    FOREIGN KEY (ID_CAMIONERO) REFERENCES CAMIONERO(ID),
    FOREIGN KEY (ID_PAQUETE) REFERENCES PAQUETE(ID)
);
