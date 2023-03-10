create database Conhecimentos_Profissionais;

use Conhecimentos_Profissionais;


create table tipo
(
	codigo integer unsigned not null auto_increment,
    tipo varchar(30) not null,
    primary key (codigo)
);
insert into tipo (tipo) values ('Licenciatura'); /*educacao fisica*/
insert into tipo (tipo) values ('Bacharelado'); /*adm*/
insert into tipo (tipo) values ('Bacharelado');  /* design */
insert into tipo (tipo) values ('tecnólogo'); /* informatica */
insert into tipo (tipo) values ('Bacharelado'); /* farmacia */

select * from tipo;




create table instrutor
(
	codigo integer unsigned not null auto_increment,
    instrutor varchar(20) not null,
    telefone varchar(9) not null,
    primary key (codigo)
);

insert into instrutor (instrutor, telefone) values ('Gustavo silva', '4353-3134');
insert into instrutor (instrutor, telefone) values ('João Freitas', '2322-1433');
insert into instrutor (instrutor, telefone) values ('Fernando Herinque', '1234-3211');
insert into instrutor (instrutor, telefone) values ('Nicole Andrade', '5654-3875');
insert into instrutor (instrutor, telefone) values ('Maria Silva', '6642-5255');

select * from instrutor;



create table curso
(
	codigo integer unsigned not null auto_increment,
    curso varchar(64) not null,
    instrutor integer unsigned not null, 
    tipo integer unsigned not null,
    valor double not null,
    primary key (codigo),
	index fk_tipo(tipo),
    index fk_instrutor(instrutor),
    foreign key(tipo) references tipo(codigo),
    foreign key(instrutor) references instrutor(codigo) 
);


select * from curso;

insert into curso (curso, instrutor, tipo, valor) values ('Educação Física', 1, 1, 1000);
insert into curso (curso, instrutor, tipo, valor) values ('Administração', 2, 2, 3000);
insert into curso (curso, instrutor, tipo, valor) values ('Desing', 3, 3, 620);
insert into curso (curso, instrutor, tipo, valor) values ('Informática', 4, 4, 4200);
insert into curso (curso, instrutor, tipo, valor) values ('Farmácia', 5, 5, 1330);

select * from instrutor join curso on instrutor.codigo = curso.codigo;

select * from tipo join curso on tipo.codigo = curso.tipo; 


create table aluno
(
	codigo integer unsigned not null auto_increment,
    aluno varchar(64) not null,
    endereco varchar(128) not null,
    email varchar(128) not null,
    cpf varchar(14) not null,
    primary key (codigo)
);

insert into aluno (aluno, endereco, email, cpf) values ('Marcos Ferreira', 'Rua joão batista', 'marcos@40gmail.com', '111.111.111-11');
insert into aluno (aluno, endereco, email, cpf) values ('João Vitor', 'Rua padre bom', 'joao@40gmail.com', '222.222.222-22');
insert into aluno (aluno, endereco, email, cpf) values ('Alex Andrade', 'Rua bernado silva', 'alex@40gmail.com', '333.333.333-33');
insert into aluno (aluno, endereco, email, cpf) values ('Leticia', 'Rua pão frito', 'leticia@40gmail.com', '444.444.444-44');
insert into aluno (aluno, endereco, email, cpf) values ('Lara silva', 'Rua pão frito', 'lara@40gmail.com', '555.555.555-55');
insert into aluno (aluno, endereco, email, cpf) values ('Laura Andrade', 'Rua palestina', 'laura@40gmail.com', '666.666.666-66');
insert into aluno (aluno, endereco, email, cpf) values ('Júlia Barros', 'Rua nova', 'julia@40gmail.com', '777.777.777-77');

select * from aluno;





create table pedido 
(
	codigo integer unsigned not null auto_increment,
    aluno integer unsigned not null,
    data date,
    hora time,                           /*apagado*/
    primary key (codigo),
    index fk_aluno(aluno),
    foreign key(aluno) references aluno(codigo)
);



select * from pedido;

insert into pedido (aluno, data, hora) values ('1', '2018-12-03', '13:40:00');

delete from pedido where aluno = 1;

insert into pedido (aluno, data, hora) values ('1', '2022-10-03', '13:40:00');
insert into pedido (aluno, data, hora) values ('2', '2022-10-22', '14:20:32');
insert into pedido (aluno, data, hora) values ('3', '2022-11-29', '11:12:10');
insert into pedido (aluno, data, hora) values ('4', '2023-01-06', '16:56:32');
insert into pedido (aluno, data, hora) values ('5', '2023-02-07', '17:34:55');
insert into pedido (aluno, data, hora) values ('6', '2023-02-06', '13:11:34');
insert into pedido (aluno, data, hora) values ('7', '2023-01-11', '17:43:21');

select * from pedido;
drop table pedido;

create table pedido 
(
	codigo integer unsigned not null auto_increment,
    aluno integer unsigned not null,
    data date,
    hora time,                           
    primary key (codigo),
    index fk_aluno(aluno),
    foreign key(aluno) references aluno(codigo)
);
select * from pedido;


insert into pedido (aluno, data, hora) values ('1', '2022-10-03', '13:40:00');
insert into pedido (aluno, data, hora) values ('2', '2022-10-22', '14:20:32');
insert into pedido (aluno, data, hora) values ('3', '2022-11-29', '11:12:10');
insert into pedido (aluno, data, hora) values ('4', '2023-01-06', '16:56:32');
insert into pedido (aluno, data, hora) values ('5', '2023-02-07', '17:34:55');
insert into pedido (aluno, data, hora) values ('6', '2023-02-06', '13:11:34');
insert into pedido (aluno, data, hora) values ('7', '2023-01-11', '17:43:21');

select * from aluno join pedido on aluno.codigo = pedido.codigo;





create table pedido_detalhe
(
	pedido integer unsigned not null,
    curso integer unsigned not null,
    valor double not null,
    index fk_pedido(pedido),
    index fk_curso(curso),
    primary key(pedido, curso),
    foreign key(pedido) references pedido(codigo),
    foreign key(curso) references curso(codigo)
);
select * from pedido_detalhe;



insert into pedido_detalhe (pedido, curso, valor) values (1, 1, 1000);
insert into pedido_detalhe (pedido, curso, valor) values (2, 2, 3000);
insert into pedido_detalhe (pedido, curso, valor) values (3, 3, 620);
insert into pedido_detalhe (pedido, curso, valor) values (4, 4, 4200);
insert into pedido_detalhe (pedido, curso, valor) values (5, 5, 1330);
insert into pedido_detalhe (pedido, curso, valor) values (6, 3, 620);
insert into pedido_detalhe (pedido, curso, valor) values (7, 2, 1330);




