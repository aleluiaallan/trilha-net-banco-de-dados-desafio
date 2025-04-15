--Buscar nome e ano:
select Filmes.Nome, Filmes.Ano from Filmes

--Buscar nome e ano por ordem crescente
select Filmes.Nome, filmes.Ano from Filmes order by filmes.ano asc

--Buscar pelo filme de volta pro futuro trazendo nome, ano e duracao
declare @busca NVARCHAR(100) = 'futuro';
select Filmes.Nome, Filmes.Ano, Filmes.Duracao from Filmes where Filmes.Nome like '%'+ @busca +'%'

--Buscar filmes lançados em 1997
select Filmes.Nome, Filmes.Ano from Filmes where Filmes.Ano = 1997

--Buscar filmes lançados após 2000
select Filmes.Nome, Filmes.Ano from Filmes where Filmes.Ano > 2000

--Buscar filmes com duracao maior que 100 e menor que 150 ordenando por duracao crescente
select Filmes.Nome, Filmes.Ano, filmes.Duracao from Filmes where Filmes.Duracao > 100 and Filmes.Duracao < 150 order by Filmes.Duracao asc

--Buscar quantidade de filmes lançados no ano, agrupado por ano e ordenado pela duracao em ordem crescente
select filmes.ano,
	   COUNT(filmes.ano) as quantidade	
from Filmes group by filmes.Ano
order by quantidade desc

--Buscar atores do genero masculino retornado primerio nome, ultimo nome
select Atores.PrimeiroNome, Atores.UltimoNome from Atores where Atores.Genero = 'M'

--Buscar atores do genero feminino, retornando primero e ultimo nome ordenado pelo primeiro nome
select Atores.PrimeiroNome, Atores.UltimoNome from Atores where Atores.Genero = 'F' order by Atores.PrimeiroNome asc

--Buscar nome do filme e o genero
select Filmes.Nome, Generos.Genero 
from Filmes, Generos, FilmesGenero
where Filmes.Id = FilmesGenero.IdFilme and Generos.Id = FilmesGenero.IdGenero

--Buscar nome do filme e genero do tipo "misterio"
declare @busca NVARCHAR(100) = 'Mistério';
select Filmes.Nome, Generos.Genero 
from Filmes, Generos, FilmesGenero
where Filmes.Id = FilmesGenero.IdFilme and Generos.Id = FilmesGenero.IdGenero and Generos.Genero like '%' + @busca + '%'

--Buscar nome do filme e os atores, trazendo primero nome, ultimo nome e seu papel
select Filmes.Nome, Atores.PrimeiroNome, Atores.UltimoNome, ElencoFilme.Papel
from Filmes, Atores, ElencoFilme
where ElencoFilme.IdAtor = Atores.Id and ElencoFilme.IdFilme = Filmes.Id
