use SuperBiblioteca;

create or replace view vw_livros_comentarios_consolidados as
select
	livros.nome as 'livro',
	count(livros_comentarios.comentario) 'quantidade_comentarios'	
from livros_comentarios
inner join livros on (livros_comentarios.id_livro = livros.id)
group by livros_comentarios.id_livro 
order by quantidade_comentarios desc, livro asc;

select * from vw_livros_comentarios_consolidados;

-- Criar uma view vw_livros_autores (listar nome do livro, quantidade de paginas, nome autor e id do autor)
create or replace view vw_livros_autores as
	select
	livros.nome as 'livro',
	livros.quantidade_paginas as 'paginas',
	autores.nome as 'autor',
	autores.id as 'id_autor'
	from livros
	inner join autores on (livros.id_autor = autores.id);

select * from vw_livros_autores;

-- Criar uma view vw_livros_categorias (listar nome da categoria, nome do livro, id da categoria e id do livro)
-- create or replace view vw_livros_categorias as 
	select
	livros.categorias as 'categoria',
	livros.nome as 'livro',
	categorias.id as 'id_categoria',
	livros.id as 'id_livro'
	from livros 
	inner join categorias on (livros.id_categoria = categorias.id);

-- Criar uma view vw_livros_editoras (listar nome da editora, nome do livro, ordenados por nome da editora)

-- Criar uma view vw_livros_editoras_autores (listar nome do livro, autor, editora onde a quantidade de páginas for maior que 1000)

-- Criar uma view vw_livros_fantasia (listar nome do livro, quantidade de paginas, descricao) da categoria 'Fantasia'

-- Criar uma view vw_livros_autor_tolkien (listar nome do livro, nome do autor) filtrar autor 'J.R.R. Tolkien'

-- Criar uma view vw_livros_por_categoria (listar nome da categoria, quantidade livros) group by necessário

-- Criar uma view vw_paginas_por_autor (listar nome do autor, soma da quantidade de páginas) group by necessário