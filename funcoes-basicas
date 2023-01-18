CREATE TABLE quadros
    (id INTEGER PRIMARY KEY,
    nome TEXT,
    artista TEXT,
    ano INTEGER,
    preco REAL);

/* 5 obras de arte mais caras */
INSERT INTO quadros (nome, artista, ano, preco)
    VALUES ("The Card Players", "Paul Cézanne", 1892, 274000000);
INSERT INTO quadros (nome, artista, ano, preco)
    VALUES ("No. 6 (Violet, Green and Red)", "Mark Rothko", 1951, 186000000);
INSERT INTO quadros (nome, artista, ano, preco)
    VALUES ("No. 5, 1948", "Jackson Pollock", 1948, 165400000);
INSERT INTO quadros (nome, artista, ano, preco)
    VALUES ("Woman III", "Willem de Kooning", 1953, 162400000);
INSERT INTO quadros (nome, artista, ano, preco)
    VALUES ("When will you marry?", "Paul Gaugin", 1892, 300000000);


/* Quantas custam mais de 2 milhões? */
SELECT COUNT(*) AS mais_que_2_milhoes
    FROM quadros WHERE preco > 200000000;

/* Quantos anos só tiveram um quadro? */
SELECT COUNT(DISTINCT ano) AS anos_com_apenas_um_quadro
    FROM quadros;

/* Qual a pintura mais cara? */
SELECT MAX(preco) as mais_cara_em_dolares
    FROM quadros;

/* Qual o ano médio? */
SELECT AVG(ano) 
    FROM quadros;

/* Qual o preço total das pinturas? */
SELECT SUM(preco) AS total_em_dolares
    FROM quadros;
