create database k9;
use k9;

create table tbl_funcionario (
f_matricula  smallint  primary key auto_increment,  
nome_func varchar(45), 
anos_servico int (10), 
salario decimal (10,3), 
cod_orgao int(7) default 021,
cod_depto smallint,
cargo varchar (50), 
cod_div smallint,
matr_gerencia smallint,
matr_superior smallint,
nome_superv varchar (50),
index(cod_div),                   
index(cod_orgao),
index(cod_depto),
index(matr_gerencia),
index(matr_superior)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;

drop table tbl_funcionario;
select * from tbl_funcionario order by f_matricula;

-- inserts tbl_funcionario

insert into tbl_funcionario (f_matricula, nome_func, anos_servico, salario, cargo) 
values ('12', 'Rodrigo', 8, 5.000, 'aux'), 
('01', 'Miguel', 13, 3.500, 'aux'), 
('07', 'joao', 4, 2.500, 'assiste_aux'), 
('19','Angelo', 2, 2.100, 'aux.finaceiro'), 
('33', 'Mario', 24, 2.200, 'ti'),
('55', 'Jose', 11, 3.300, 'ti'),
('06', 'Ana', 10, 4.600, 'ti'),
('22', 'Francisco', null, 7.900, 'ti') ; 

insert into tbl_funcionario (f_matricula, nome_func, anos_servico, salario, cargo, nome_superv, matr_superior) 
values (18, 'Pitch', 3, 800, 'estagiario', 'Dario', 13);

insert into tbl_funcionario (f_matricula, nome_func, anos_servico, salario, cargo, nome_superv, matr_superior) 
values (05, 'davi', 5, 8.300, 'investigador', 'Vinicius', 17 );


insert into tbl_funcionario(f_matricula, nome_func, anos_servico, salario ,cod_depto, cod_orgao, cod_div, cargo, matr_gerencia, nome_superv, matr_superior) 
values(02,'aline',5,15.000,7,021,1, 'gerentes de departamento',2 , 'Dario', 13);

insert into tbl_funcionario(f_matricula, nome_func, anos_servico, salario ,cod_depto, cod_orgao, cod_div, cargo, matr_gerencia, nome_superv, matr_superior)  
values(03,'anne',5,10.000,7,021,2, 'gerentes de divisao',1, 'Vinicius', 17 );

insert into tbl_funcionario(f_matricula, nome_func, anos_servico, salario ,cod_depto, cod_orgao, cod_div, cargo, matr_gerencia, nome_superv, matr_superior)
values(04,'Romeu',9,30.000,7,021,1, 'gerentes de departamento',2 , 'Dario', 13);

insert into tbl_funcionario(f_matricula, nome_func, anos_servico, salario ,cod_depto, cod_orgao, cod_div, cargo, matr_gerencia, nome_superv, matr_superior)  
values(99,'Charlie',10,30.000, 7, 021 ,2, 'gerentes de divisao',1 , 'Vinicus', 17);


truncate tbl_funcionario


create table tbl_orgao (
cod_orgao int(7) default 021 primary key, 
nome_orgao varchar (45) 
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;

insert into tbl_orgao(nome_orgao) values ('Ministério da Defesa');
select * from tbl_orgao;


create table tbl_departamento(
cod_depto smallint primary key,####
localizacao varchar (45)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;
alter table tbl_departamento add column nome_depto varchar(45) default 'Policia Federal';
insert into tbl_departamento (cod_depto, localizacao) values (07, 'Brasilia-DF') 
select * from tbl_departamento;

create table tbl_divisao(
cod_div smallint primary key auto_increment,
nome_div varchar (45)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;

insert into tbl_divisao(nome_div) values ('div_cybersegurança');
insert into tbl_divisao(nome_div) values ('div_armas');

truncate table tbl_divisao;
select * from tbl_divisao;
drop table tbl_divisao;

create table tbl_subordinado (
cod_depto int (7), 
cod_div int(7), 
index(cod_depto),
index(cod_div),
primary key (cod_depto, cod_div)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;

create table tbl_gerencia (
matr_gerencia smallint primary key auto_increment, 
nome_ger varchar (45),
cod_orgao smallint ,
cod_div smallint,
index(cod_orgao),
index(cod_div)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;

truncate tbl_gerencia;
drop table tbl_gerencia
select * from tbl_gerencia;

alter table tbl_gerencia add column sa int (6);
insert into tbl_gerencia(nome_ger, cod_div) values ('ger_administrativo',1);
insert into tbl_gerencia(nome_ger, cod_div) values ('ger_financeiro',2);
insert into tbl_gerencia(nome_ger, matr_gerencia, cod_div) values ('ger_segurança', 31,1)

create table tbl_func_comum (
matr_func varchar(45) primary key, 
cargo VARCHAR (45)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8;

create table tbl_projeto (
cod_proj smallint primary key auto_increment,
 nome_proj varchar(45),
 inicio date,
 fim date
 )ENGINE=MyISAM DEFAULT CHARSET=UTF8;
 
 select * from tbl_projeto
 
 insert into tbl_projeto (nome_proj, inicio, fim) values ('escoteiro', '2021-05-30', '2022-8-9');
 insert into tbl_projeto (nome_proj, inicio, fim) values ('cyber', '2021-03-30', '2021-8-9');
 

create table tbl_aloca (
cod_proj int(6),
 matr_func varchar(45),
 data_alocacao date,
 index(matr_func),
 index(cod_proj),
 primary key (matr_func, cod_proj)
 )ENGINE=MyISAM DEFAULT CHARSET=UTF8;

create table tbl_coordena (
cod_proj int (6),
 matr_coord varchar (45) primary key ,
 data_alocacao date,
  index(cod_proj),
  index(data_alocacao)
 )ENGINE=MyISAM DEFAULT CHARSET=UTF8;

create table tbl_supervisiona (
matr_superior smallint primary key auto_increment,
  matr_func varchar(45),
  nome_superior varchar (45),
  index(matr_func)
 )ENGINE=MyISAM DEFAULT CHARSET=UTF8;
 
 

create table tbl_proj_tecnico (
cod_proj_tec smallint  primary key auto_increment,
 area_pesquisa varchar (50),
 cod_proj smallint,
 index(cod_proj)
 )ENGINE=MyISAM DEFAULT CHARSET=UTF8;
 

-- 1
select * from tbl_funcionario order by f_matricula;

-- 2
select count(f_matricula)
from tbl_funcionario;

-- 3
select nome_func, anos_servico
from tbl_funcionario
where anos_servico between 10 and 12;

-- 4
select nome_func as nome, 
f_matricula, salario
from tbl_funcionario
where salario not between 1.000 and 3.000;

-- 5

select nome_func as nome,
anos_servico
from tbl_funcionario
where anos_servico in (5, 8, 13) or anos_servico is null;

-- 6

select nome_func, substring(nome_func, 2,2) as letras
from tbl_funcionario
where nome_func like  'an' or 'on';
order by f_matricula;

select nome_func
from tbl_funcionario
where nome_func like '_an%'
or nome_func like '_on%';

-- 7
select f_matricula, 
nome_func as nomefuncionario,
salario
from tbl_funcionario
order by nome_func;

-- 8

select anos_servico as 'anos_serviço',
f_matricula, nome_func, salario
from tbl_funcionario
order by anos_servico desc;

-- 9

select tbl_departamento.nome_depto, tbl_funcionario.f_matricula, tbl_funcionario.nome_func,
tbl_funcionario.salario
from tbl_departamento, tbl_funcionario 
 order by tbl_funcionario.salario desc ;

-- 10 

select tbl_gerencia.nome_ger, tbl_divisao.cod_div, tbl_divisao.nome_div
from tbl_gerencia, tbl_divisao
where tbl_gerencia.cod_div = tbl_divisao.cod_div ;


-- 11
select tbl_gerencia.matr_gerencia as 'matricula do funcionario', tbl_gerencia.nome_ger, tbl_funcionario.anos_servico, tbl_funcionario.salario ,tbl_divisao.cod_div, tbl_divisao.nome_div
from tbl_gerencia, tbl_divisao, tbl_funcionario
where tbl_funcionario.cod_div = tbl_divisao.cod_div and tbl_gerencia.cod_div = tbl_divisao.cod_div 
and tbl_divisao.cod_div and tbl_funcionario.salario > 2.000 and tbl_gerencia.matr_gerencia > 30 and tbl_funcionario.salario > 6;

-- 12
select tbl_funcionario.nome_func as 'nome do funcionario', tbl_funcionario.cargo
from tbl_funcionario
where tbl_funcionario.cod_div = 2 and nome_func like '_nd%' '_la%';

-- 13tbl_gerencia;
select tbl_funcionario.f_matricula,cargo,anos_servico,salario 
from tbl_funcionario
where f_matricula > 4 ;

-- 14
select tbl_departamento.nome_depto, tbl_funcionario.f_matricula,nome_func, salario
from tbl_departamento, tbl_funcionario
where tbl_funcionario.cod_depto =7   
order by tbl_funcionario.salario desc;

select tbl_departamento.nome_depto, tbl_funcionario.f_matricula,nome_func, salario
from tbl_departamento, tbl_funcionario
where tbl_funcionario.cod_depto =7   
order by tbl_funcionario.salario desc;

-- 15
select tbl_funcionario.nome_func, tbl_departamento.nome_depto, tbl_funcionario.nome_superv as 'supervisores'
from tbl_funcionario, tbl_departamento
where tbl_departamento.cod_depto = tbl_funcionario.cod_depto order by tbl_funcionario.f_matricula;

-- 16
select matr_superior, f_matricula, nome_func, nome_superv as 'supevisores'
from tbl_funcionario
where matr_superior like  '13%' 
union
select matr_superior, f_matricula, nome_func, nome_superv as 'supevisores'
from tbl_funcionario
where matr_superior like '17%'
order by f_matricula  and matr_superior ;

-- 17

select tbl_funcionario.nome_func, tbl_funcionario.f_matricula, cargo
from tbl_funcionario
where cargo <> 'gerentes de divisao' and cargo <> 'gerentes de departamento';

-- 18 
select tbl_funcionario.f_matricula, tbl_funcionario.nome_func, tbl_departamento.nome_depto, cargo
from tbl_funcionario, tbl_departamento
where tbl_funcionario.matr_gerencia = 1 or tbl_funcionario.matr_gerencia = 2;

-- 19

select tbl_projeto.cod_proj, tbl_projeto.nome_proj, tbl_projeto.inicio, tbl_projeto.fim
from tbl_projeto;

-- 20
select nome_func ,avg(salario)as 'media salaria',  avg(anos_servico) as 'media anaos de serviço'
from tbl_funcionario

-- 21
select avg(tbl_funcionario.salario) as 'media policia federal'
from tbl_funcionario
where cod_depto = 7

-- 22

select count(nome_func) as 'nome funcionario', sum(salario) / count(nome_func) as 'media'
from tbl_funcionario
where cod_div group by cod_div;

-- 23
select nome_superv, nome_func
from tbl_funcionario
where matr_superior = 13 or matr_superior = 17;

-- 24

select cargo, avg(salario) as 'salario medio'
from tbl_funcionario
group by cargo;


-- 25

select tbl_divisao.cod_div, tbl_divisao.nome_div, tbl_departamento.cod_depto, tbl_departamento.nome_depto
from tbl_departamento, tbl_divisao
order by tbl_divisao.cod_div




