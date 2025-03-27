drop database if exists EmpresaDb;
create database EmpresaDb;
use EmpresaDb;

create table departamentos (
    id int primary key auto_increment,
    nome varchar(45) not null
);

create table funcionarios(
    id int primary key auto_increment,
    nome varchar(45) not null,

    id_departamento int,
    foreign key (id_departamento) references departamentos(id)
);
alter table funcionarios add column cpf varchar(45) default '' not null;

create table categorias(
    id int primary key auto_increment,
    nome varchar(45) not null
);

create table atividades(
    id int primary key auto_increment,
    nome varchar(45) not null
);
alter table atividades add column descricao varchar(45);
alter table atividades add column tempo_gasto int not null;
alter table atividades add column id_funcionario int not null;
alter table atividades 
    add constraint fk_funcionarios_atividades 
    foreign key (id_funcionario)
    references funcionarios (id);

alter table atividades add column id_categoria int not null;

alter table atividades
    add constraint fk_categorias_atividades
    foreign key(id_categoria) references categorias(id);



-- Inserindo dados na tabela departamentos
insert into departamentos (nome) values 
('Recursos Humanos'),
('Financeiro'),
('TI'),
('Marketing'),
('Jurídico'),
('Logística'),
('Vendas'),
('Suporte'); -- suporte não tem funcionários

-- Inserindo dados na tabela funcionarios
insert into funcionarios (nome, id_departamento, cpf) values 
('Carlos Silva', 6, '123.456.789-00'), -- sem atividade
('Ana Souza', 2, '234.567.890-01'),
('Lucas Lima', 1, '345.678.901-02'),
('Mariana Alves', 3, '456.789.012-03'),
('Gabriel Costa', 4, '567.890.123-04'),
('Patrícia Rocha', 7, '678.901.234-05'),
('Juliana Martins', 5, '789.012.345-06');-- id 7 

-- Inserindo dados na tabela categorias
insert into categorias (nome) values 
('Administração'), -- 1 (sem atividade)
('Financeiro'), -- 2
('Desenvolvimento'), -- 3
('Marketing Digital'), -- 4
('Jurídico'), -- 5
('Vendas'), -- 6
('Suporte Técnico'), -- 7
('Logística'); -- 8

-- Inserindo dados na tabela atividades
insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Reunião de equipe', 'Reunião semanal para alinhamento', 60, 2, 2);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Análise de orçamento', 'Análise de números financeiros', 120, 2, 3);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Desenvolvimento de sistema', 'Criação de novas funcionalidades', 180, 3, 4);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Campanha publicitária', 'Criação de conteúdo para campanha', 90, 4, 5);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Consultoria jurídica', 'Análise de contratos', 150, 5, 6);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Gestão de equipe', 'Coordenação das equipes de vendas', 110, 6, 7);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Suporte a clientes', 'Atendimento ao cliente via chat', 45, 7, 8);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Logística de entrega', 'Planejamento das entregas de mercadorias', 75, 6, 2);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Treinamento de novos funcionários', 'Treinamento sobre procedimentos internos', 60, 6, 2); -- funcionário sem atividade





-- Consultar os dados do departamento (sem buscar informações de outras tabelas)
select id, nome from departamentos;
-- Consultar os dados do funcionário (sem buscar informações de outras tabelas)
select id, nome, cpf, id_departamento from funcionarios;
-- Consultar os dados da categoria (sem buscar informações de outras tabelas)
select id, nome from categorias;
-- Consultar os dados da atividade (sem buscar informações de outras tabelas)
select id, nome, descricao, tempo_gasto, id_funcionario, id_categoria from atividades;


-- Consultar o nome do funcionário e seu departamento
select
    f.nome as 'Funcionário',
    d.nome as 'Departamento'
    from funcionarios as f
    inner join departamentos as d on(f.id_departamento = d.id);

-- as => alias => apelido
-- Consultar a atividade e sua categoria
select 
    at.nome as 'Atividade',
    cat.nome as 'Categoria'
    from atividades as at
    inner join categorias as cat on (at.id_categoria = cat.id);

-- Consultar a atividade, nome funcionário
select
    ati.nome as 'Atividade',
    fun.nome as 'Funcionário'
    from atividades as ati
    inner join funcionarios as fun on (ati.id_funcionario = fun.id);


-- Consultar a atividades relacionadas aos departamentos
-- Consultar o nome da atividade, nome do funcionário e nome do departamento
select
    atividades.nome AS 'Atividade',
    funcionarios.nome AS 'Funcionário',
    departamentos.nome AS 'Departamento'
    from atividades
    inner join funcionarios on (atividades.id_funcionario = funcionarios.id)
    inner join departamentos on (funcionarios.id_departamento = departamentos.id);


select
    atividades.nome as 'Atividade',
    funcionarios.nome as 'Funcionario',
    departamentos.nome as 'Departamento',
    categorias.nome as 'Categoria'
    from atividades
    inner join categorias on (atividades.id_categoria = categorias.id)
    inner join funcionarios on (atividades.id_funcionario = funcionarios.id)
    inner join departamentos on (funcionarios.id_departamento = departamentos.id);