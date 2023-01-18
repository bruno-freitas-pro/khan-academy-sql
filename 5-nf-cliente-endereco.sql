/*
Cria a tabela clientes

Com a coluna cliente_id que deve conter valores inteiros, é utilizada como chave primária e o valor da coluna é incrementado automaticamente em +1 a cada novo registro;

E a coluna cliente_nome, que é de texto
*/

CREATE TABLE clientes (
    cliente_id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_nome TEXT
);

/*
Cria a tabela endereços

Com a coluna endereco_id, que deve conter valores inteiros, é utilizada como chave primária e o valor da coluna é incrementado automaticamente em +1 a cada novo registro;

A coluna cliente_id deve conter valores inteiros (-1, 0, 1, 2 etc)

A coluna endereco deve conter strings (cadeias de caracteres - texto entre aspas)

Na última linha, está declarado que a coluna cliente_id da tabela endereços é uma CHAVE ESTRANGEIRA e faz REFERÊNCIA à coluna cliente_id da tabela de clientes que criamos acima.
*/

CREATE TABLE enderecos (
    endereco_id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER,
    endereco TEXT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

/*
Cria a tabela notas_fiscais

Com a coluna nota_fiscal, que deve conter valores inteiros, é utilizada como chave primária e o valor da coluna é incrementado automaticamente em +1 a cada novo registro;

A coluna cliente_id deve conter valores inteiros (-1, 0, 1, 2 etc)

A coluna endereco_id deve conter strings (cadeias de caracteres - texto entre aspas)

Na penúltima linha, declaramos que a coluna cliente_id da tabela endereços é uma CHAVE ESTRANGEIRA e faz REFERÊNCIA à coluna cliente_id da tabela de clientes que criamos acima.

Na última linha, declaramos que a coluna endereco_id da tabela endereços é uma CHAVE ESTRANGEIRA e faz REFERÊNCIA à coluna endereco_id da tabela de enderecos que criamos acima.
*/

CREATE TABLE notas_fiscais (
    nota_fiscal_id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER,
    endereco_id INTEGER,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (endereco_id) REFERENCES enderecos(endereco_id)
);

/*
Registrar os nomes dos clientes
*/

INSERT INTO clientes (cliente_nome) VALUES ("Joyce Byers");
INSERT INTO clientes (cliente_nome) VALUES ("Harry Potter");

/*
Registrar os endereços e marcar a qual cliente cada endereço pertence, sendo que Joyce Byers tem dois endereços e Harry Potter tem um só
*/

INSERT INTO enderecos (cliente_id, endereco) VALUES (1, "149 Coastline Rd, Fayetteville, GA, USA");
INSERT INTO enderecos (cliente_id, endereco) VALUES (1, "149 Coastline Rd, Fayetteville, GA, USA, mundo invertido");
INSERT INTO enderecos (cliente_id, endereco) VALUES (2, "Hogwarts Castle, Highlands, Scotland, Great Britain");

/*
Registrar as notas fiscais e referenciar os clientes e endereços

Importante! No formato que escrevemos o código, nenhuma validação ´é feita para identificar se o endereço realmente pertence àquele cliente.

Perceba que na primeira linha de declaramos o número da nota fiscal, pois eu queria que o primeiro número fosse 10383.

Nas linhas seguintes, declaramos apenas cliente_id e endereco_id
*/

INSERT INTO notas_fiscais (nota_fiscal_id, cliente_id, endereco_id) VALUES (10383, 1, 1);
INSERT INTO notas_fiscais (cliente_id, endereco_id) VALUES (1, 1);
INSERT INTO notas_fiscais (cliente_id, endereco_id) VALUES (1, 2);
INSERT INTO notas_fiscais (cliente_id, endereco_id) VALUES (1, 2);
INSERT INTO notas_fiscais (cliente_id, endereco_id) VALUES (1, 2);
INSERT INTO notas_fiscais (cliente_id, endereco_id) VALUES (2, 3);
INSERT INTO notas_fiscais (cliente_id, endereco_id) VALUES (2, 3);

/*
Agora vem a parte das consultas.

Na primeira consulta, selecionamos todas as colunas da tabela clientes para ver como está a estrutura delas. Você consegue visualizar o resultado na tela à direita.
*/

SELECT * FROM clientes;

/*
Na segunda consulta, selecionamos nessa ordem de visualização:
    endereco_id na tabela enderecos (chave primária)
    cliente_id na tabela enderecos (chave estrangeira)
    cliente_nome na tabela clientes (texto legível para humanos)
    endereco na tabela enderecos (texto legível para humanos)
    
Só que como estamos consultando duas tabelas ao mesmo tempo, é necessário usar o LEFT OUTER JOIN (JUNÇÃO EXTERNA À ESQUERDA)

Declaramos que NA VISUALIZAÇÃO vamos juntar a tabela clientes com a tabela enderecos por meio do campo cliente_id, que existe nas duas tabelas.

IMPORTANTE! Juntar na visualização não altera o banco de dados, pois é um mecanismo de consulta.
*/

SELECT endereco_id, enderecos.cliente_id, clientes.cliente_nome, endereco FROM enderecos
LEFT OUTER JOIN clientes ON clientes.cliente_id = enderecos.cliente_id
;

/*
Na terceira consulta, selecionamos:
    nota_fiscal_id na tabela notas_fiscais (chave primária)
    cliente_id na tabela notas fiscais (chave estrangeira)
    cliente_nome na tabela clientes (texto legível para humanos)
    endereco_id na tabela notas_fiscais(chave estrangeira)
    endereco na tabela enderecos (texto legível para humanos)

Só que como estamos consultando duas tabelas ao mesmo tempo, é necessário usar o LEFT OUTER JOIN (JUNÇÃO EXTERNA À ESQUERDA).

Declaramos que NA VISUALIZAÇÃO vamos juntar:
    
    A tabela clientes com a tabela notas_fiscais por meio do campo cliente_id, que existe nas duas tabelas
    
    A tabela enderecos com a tabela notas_fiscais por meio do campo endereco_id, que existe nas duas tabelas
    
IMPORTANTE! Juntar na visualização não altera o banco de dados, pois é um mecanismo de consulta.
*/

SELECT nota_fiscal_id, notas_fiscais.cliente_id, clientes.cliente_nome, notas_fiscais.endereco_id, enderecos.endereco FROM notas_fiscais
LEFT OUTER JOIN clientes ON clientes.cliente_id = notas_fiscais.cliente_id
LEFT OUTER JOIN enderecos ON enderecos.endereco_id = notas_fiscais.endereco_id;
