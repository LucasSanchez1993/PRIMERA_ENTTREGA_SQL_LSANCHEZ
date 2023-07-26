
use primera_entrega;


CREATE TABLE pagina_empresa(
cuenta varchar(50) not null,
cuit INT NOT NULL,
direccion varchar(60) not null,
preguntas varchar(200),
primary key(cuit)
);

CREATE TABLE cuenta(
id INT NOT NULL,
cuit_empresa INT NOT NULL,
NAME varchar(30) NOT NULL,
password varchar(20) NOT NULL,
FOREIGN KEY(cuit_empresa) references pagina_empresa(cuit),
primary key(id));

CREATE TABLE DATOS_CLIENTES(
ID_CUENTA INT NOT NULL,
NOMBRE VARCHAR(30) NOT NULL,
APELLIDO VARCHAR(30) NOT NULL,
DNI INT NOT NULL UNIQUE,
DIRECCION varchar(50) NOT NULL,
primary key(ID_CUENTA)
);

CREATE TABLE proveedores(
nombre VARCHAR(20) UNIQUE NOT NULL,
telefono INT NOT NULL,
seccion VARCHAR(40),
nombre_mercaderia VARCHAR(50) NOT NULL,
id_mercaderia  INT NOT NULL AUTO_INCREMENT,
primary key(id_mercaderia,telefono)
);

CREATE TABLE mercaderias(
id_merca INT NOT NULL,
nombre VARCHAR(45) NOT NULL,
precio DECIMAL(6,2),
stock  INT NOT NULL,
FOREIGN KEY(id_merca) REFERENCES proveedores(id_mercaderia)
);

 CREATE TABLE PEDIDOS(
 direccion_de_entrega VARCHAR(50) NOT NULL,
 numero_pedido INT NOT NULL,
 fecha_entrega VARCHAR(30),
id INT NOT NULL,
mercaderias_pedidas INT NOT NULL,
FOREIGN KEY(id) REFERENCES DATOS_CLIENTES(ID_CUENTA),
FOREIGN KEY(mercaderias_pedidas) REFERENCES mercaderias(id_merca)
);

CREATE TABLE reclamos(
numero_de_seguimiento VARCHAR(10) NOT NULL,
tipo_de_reclamo VARCHAR(30) not null,
id INT NOT NULL,
FOREIGN KEY(id) REFERENCES DATOS_CLIENTES(ID_CUENTA)
);

ALTER TABLE cuenta
CHANGE COLUMN id id INT NOT NULL AUTO_INCREMENT;

CREATE UNIQUE INDEX NAME_CUENTA
ON cuenta(NAME);

ALTER TABLE reclamos
CHANGE COLUMN numero_de_seguimiento numero_de_seguimiento INT NOT NULL;

ALTER TABLE PEDIDOS
CHANGE COLUMN numero_pedido numero_pedido INT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (numero_pedido);

create table pedido_mercaderia(
id int not null,
pedidos int not null, 
mercaderia int not null, 
cantidad int not null,
foreign key (mercaderia) references mercaderias(id_merca),
foreign key (pedidos) references PEDIDOS(numero_pedido),
primary key (id)
);

CREATE TABLE cliente_reclamo(
number int not null auto_increment,
tipo VARCHAR(30) NOT NULL,
id_client int not null,
FOREIGN KEY(id_client) REFERENCES DATOS_CLIENTES(DNI),
PRIMARY KEY (number));


 
 #FOREIGN KEY(tipo) REFERENCES reclamos(tipo_de_reclamo), QUIERO PONER ESTO Y NO ME DEJA QUISIERA SABER PORQUE.
 


