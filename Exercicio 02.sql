
-- Tabela Estados
-- id PK
-- nome
-- sigla

-- Tabela cidades
-- id PK
-- nome
-- quantidade de habitantes
-- id_estado FK

-- Tabela bairros
-- id PK
-- nome
-- id_cidade FK

-- Tabela Endereco
-- id PK
-- logradouro
-- numero
-- cep
-- id_bairro FK


-- Criar 2 estados 
-- Criar para cada estado 2 cidades
-- Criar para cada cidade 2 bairros
-- Criar para cada bairro 2 endereços

-- Consulta selects normais (sem inner join)
-- Consulta endereco, bairro
-- Consulta estado, cidade
-- COnsulta cidade, bairro
-- Consulta estado, cidade, bairro
-- Consutla cidade, bairro, endereco
-- Consutla estado, cidade, bairro, endereco
-- Consulta cidade, bairro, endereco do estado com a sigla 'SC'
