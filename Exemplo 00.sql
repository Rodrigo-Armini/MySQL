-- Apagar o banco de dados 'sistema_proway' se existir esse banco de dados
DROP DATABASE IF EXISTS sistema_proway;

-- Criar o banco de dados
CREATE DATABASE sistema_proway;

-- Definir o banco de dados que iremos utilizar
USE sistema_proway;

-- Consultar todos os bancos de dados dessa conexão 
SHOW SCHEMAS;

-- Criar uma tabela chamada curso
CREATE TABLE curso (
	id INT, -- Coluna do tipo inteiro
    nome VARCHAR(45) -- Coluna do tipo texto que permite armazenar até 45 caracteres
);

-- Consultar os registros da tabela curso
SELECT id, nome FROM curso;

-- Consultar o que a tabela tem
DESCRIBE curso;

-- Null é utilizado para dizer que a coluna permite valor null
-- Not null é utilizado para dizer que a coluna não permite valor null
-- Coluna not null ela é obrigatória, ou seja, vc terá que informar valor no INSERT

-- Alterar o nome da tabela de curso para cursos
ALTER TABLE curso RENAME TO cursos;

-- Consultar os registros da tabela de cursos
SELECT id, nome FROM cursos;

-- Inserir um registro na tabela de cursos preenchendo as colunas de id e nome
INSERT INTO cursos (id, nome) VALUE (1, "Orlando");

-- Consultar os registros
-- SELECT colunas FROM nome_tabela
SELECT id, nome FROM cursos;

-- Inserir dois registros na tabela de cursos
INSERT INTO cursos (id, nome) VALUE (2, "Python Fundamentos");
INSERT INTO cursos (id, nome) VALUE (3, "MySQL");

USE sistema_proway;
SELECT id, nome FROM cursos;

USE sistema_proway;
-- Atualizar na tabela de cursos o nome do 'Orlando' para 'CSS Fundamentos'
UPDATE cursos SET nome = 'CSS Fundamentos';

UPDATE cursos SET nome = 'CSS Fundamentos' WHERE id = 1;
UPDATE cursos SET nome = 'Python Fundamentos' WHERE id = 2;
UPDATE cursos SET nome = 'MySQL' WHERE id = 3;

-- Consultar os registros da tabela de cursos
SELECT id, nome FROM cursos;

-- Inserir um registro errado
INSERT INTO cursos (id) VALUE (4);

-- Consultando todos os cursos
SELECT id, nome FROM cursos;
-- Consultar todos os cursos que o nome é null
SELECT id, nome FROM cursos WHERE nome IS NULL;
-- Consultar todos os cursos que o nome não é null
SELECT id, nome FROM cursos WHERE nome IS NULL;

-- Apagar o registro errado
DELETE FROM cursos WHERE id = 4;

SELECT id, nome FROM cursos;

-- Adicionar coluna de duração na tabela de cursos
ALTER TABLE cursos ADD COLUMN  duracao TIME;
-- Adicionar coluna de link na tabela de cursos
ALTER TABLE cursos ADD COLUMN link VARCHAR(200);

SELECT id, nome, duracao, link FROM cursos;
-- Definir a duração do curso CSS FUndamentos
UPDATE cursos SET duracao = '20:00' WHERE id = 1;
-- Definir o link do curso CSS Fundamentos
UPDATE cursos SET link = 'https://www.proway.com.br/curso/fundamentos-em-css' WHERE id = 1;

-- Definir a duração, link do curso Python Fundamentos
UPDATE cursos SET 
	duracao = '20:00', 
    link = 'https://www.proway.com.br/curso/python-fundamentos'
    WHERE id = 2;

-- Consultar os cursos que não tem definido o link
SELECT id, nome, link FROM cursos WHERE link IS NULL;