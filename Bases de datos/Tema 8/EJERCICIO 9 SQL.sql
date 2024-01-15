DROP SCHEMA IF EXISTS TIENDA;

CREATE SCHEMA TIENDA;

USE TIENDA;

CREATE TABLE CLIENTE (
    ID INT PRIMARY KEY AUTO_INCREMENT, 
    NOMBRE VARCHAR(20), 
    SALDO_EUROS DECIMAL
); 

CREATE TABLE CLIENTE_TIENE_DIRECCIÓN (
    ID_CLIENTE INT, 
    DIRECCIÓN VARCHAR(20),
    PRIMARY KEY (ID_CLIENTE),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID)
);

CREATE TABLE ARTÍCULO (
    ID INT PRIMARY KEY AUTO_INCREMENT, 
    NOMBRE VARCHAR(20) 
);

CREATE TABLE ALMACÉN (
    ID INT PRIMARY KEY, 
    TELÉFONO VARCHAR(9), 
    TOTAL_ARTÍCULOS INT
); 

CREATE TABLE ALMACÉN_PROVEE_ARTÍCULO (
    ID_ALMACÉN INT, 
    ID_ARTÍCULO INT, 
    STOCK INT,
    PRIMARY KEY (ID_ALMACÉN, ID_ARTÍCULO),
    FOREIGN KEY (ID_ALMACÉN) REFERENCES ALMACÉN(ID),
    FOREIGN KEY (ID_ARTÍCULO) REFERENCES ARTÍCULO(ID)
);

CREATE TABLE CLIENTE_COMPRA_ARTÍCULO_ALMACÉN (
    ID INT PRIMARY KEY AUTO_INCREMENT, 
    ID_CLIENTE INT,
    ID_ARTÍCULO INT, 
    ID_ALMACÉN INT, 
    FECHA DATE, 
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID),
    FOREIGN KEY (ID_ARTÍCULO) REFERENCES ARTÍCULO(ID),
    FOREIGN KEY (ID_ALMACÉN) REFERENCES ALMACÉN(ID)
);
