create database vendas_de_carros;

use vendas_de_carros;


create table carros
(
	codigo int unsigned not null auto_increment,
    modelo varchar (20) not null,
    ano int not null,
    preço double not null,
    primary key (codigo)
);


select * from carros;

insert into carros(codigo, modelo, ano, preço) values ('111', 'Saveiro', 2015, 40000);
insert into carros(codigo, modelo, ano, preço) values ('222', 'Golf', 2012, 35000);
insert into carros(codigo, modelo, ano, preço) values ('333', 'Gol', 2020, 100000);
insert into carros(codigo, modelo, ano, preço) values ('444', 'S10', 2019, 230000);
insert into carros(codigo, modelo, ano, preço) values ('555', 'Hilux', 2022, 400.000);

delete from carros where codigo = 555; 



create table clientes
(
	nome varchar (45) not null,
    cpf varchar (14) not null,
    estado varchar (2) not null,
    codigo int unsigned not null auto_increment,
    primary key (codigo)
);

insert into clientes(nome, cpf, codigo, estado) values ('Alexadre', '111.111.111-11', 222, 'PE');
insert into clientes(nome, cpf, codigo, estado) values ('João', '222.222.222-22', 111, 'SP');
insert into clientes(nome, cpf, codigo, estado) values ('Lucas', '333.333.333-33', 444, 'RJ');
insert into clientes(nome, cpf, codigo, estado) values ('Marcelo', '444.444.444-44', 333, 'BH');


select * from clientes;


select * from clientes join carros on clientes.codigo = carros.codigo 

