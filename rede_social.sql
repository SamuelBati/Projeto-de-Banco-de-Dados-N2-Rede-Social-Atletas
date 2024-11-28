create database if not exists rede_social_atleta;
use rede_social_atleta;

create table usuario(
id_usuario serial primary key,
nome_usuario varchar(100) not null unique,
email_usuario varchar(100) not null unique,
data_nascimento date not  null,
foto_perfil_url text
);

create table amizades(
id_conexao serial primary key,
usuario1_da_conexao int references usuario(id_usuario),
usuario2_da_conexao int references usuario(id_usuario)
);

create table postagens(
id_postagem serial primary key,
data_da_postagem datetime,
conteudo_postagem text not null,
tipo_de_postagem varchar(200) not null,
autor_da_postagem int references usuario(id_usuario)
);

create table comentarios(
id_comentario serial primary key,
comentario varchar(200) not null,
postagem_referenciada_id int references postagens(id_postagem),
comentario_referenciado_id int references comentarios(id_comentario),
usuario_dono_do_comentario_id int references usuario(id_usuario),
data_do_comentario datetime
);

create table grupos (
id_grupo serial primary key,
nome_do_grupo varchar(20) unique not null,
descricao_do_grupo varchar(200),
data_de_criacao datetime
);

create table membros_do_grupo(
id_do_grupo_referenciado int references grupos(id_grupo),
id_membros_do_grupo int references usuario(id_usuario),
funcao_do_membro varchar(20) not null,
primary key(id_do_grupo_referenciado, id_membros_do_grupo)
);

create table tag (
id_tag serial primary key,
nome_da_tag varchar(50) unique not null
);

create table tags_e_seus_usuarios_atribuidos(
id_usuario_referenciado int references usuario(id_usuario),
id_tag_atribuida int references tag(id_tag),
primary key(id_usuario_referenciado, id_tag_atribuida)
);


insert into usuario (nome_usuario, email_usuario, data_nascimento, foto_perfil_url) values
('Cristiano Ronaldo', 'cristianoportugal@gmail.com', '1985-02-05', 'https://img.a.transfermarkt.technology/portrait/big/8198-1694609670.jpg?lm=1'),
('Lionel Messi', 'messijogamuito@gmail.com', '1986-06-24', 'https://img.a.transfermarkt.technology/portrait/big/28003-1710080339.jpg?lm=1'),
('Neymar Junior', 'neymarjuninhobr@gmail.com', '1992-02-05', 'https://www.estrelando.com.br/uploads/2023/11/02/neymar-jr-capa-1698964659.jpg'),
('Kylian Mbappé', 'kylianbomdegol@gmail.com', '1998-12-20', 'https://www.ogol.com.br/img/jogadores/new/45/08/394508_kylian_mbappe_20240809095413.png'),
('Edson Pelé', 'pele2rrebenta@gmail.com', '1940-10-23', 'https://conteudo.imguol.com.br/c/esporte/d4/2022/05/11/pele-1652290787737_v2_450x600.jpg'),
('Michael J.Jordan', 'airjojo@gmail.com', '1963-02-17', 'https://sextante.com.br/wp-content/uploads/2019/04/MichaelJordan.png'),
('Antony Davis', 'anton1d2ve@gmail.com', '1993-03-11', 'https://www.ogol.com.br/img/jogadores/new/13/21/571321_anthony_davis_20241106021750.png'),
('Nikola Jokic´', 'nick0la@gmail.com', '1995-02-19', 'https://img.olympics.com/images/image/private/t_1-1_300/f_auto/primary/y1pyu8k5ovpcz8de7ahb'),
('Patrick Mahomes', 'chef5mahomes@gmail.com', '1995-09-17', 'https://www.esportelandia.com.br/wp-content/uploads/2024/02/IMG_9299-1200x800.jpeg'),
('Ayrton Senna', 'senninha3veloz@gmail.com', '1960-03-21', 'https://upload.wikimedia.org/wikipedia/commons/3/38/Ayrton_Senna_8_%28cropped%29.jpg');

insert into amizades(usuario1_da_conexao, usuario2_da_conexao) values
('1', '2'),
('1', '3'),
('1', '4'),
('3', '5'),
('5', '10'),
('6', '7'),
('6', '8'),
('6', '9'),
('3', '10'),
('7', '9');

insert into postagens (data_da_postagem, conteudo_postagem, tipo_de_postagem, autor_da_postagem) values
(now(), 'https://extra.globo.com/incoming/22062756-0ca-548/w448/cristiano-ronaldo-filha.jpg', 'foto', '1'),
(now(), 'https://img.odcdn.com.br/wp-content/uploads/2022/12/messi-copa-2022.jpg', 'foto', '2'),
(now(), 'https://www.areavip.com.br/wp-content/uploads/2017/03/neymar-e-rafaella3.jpg', 'foto', '3'),
(now(), 'https://www.lance.com.br/galerias/wp-content/uploads/2022/08/memes-mbappe-neymar-psg-17-485x474.jpg', 'meme', '4'),
(Now(), 'Saudade de quando no footbol a gente ia metendo o loco e n parava de jogar por qualquer coisinha besta', 'texto', '5' ),
(now(), 'https://static.nike.com/a/images/f_auto,cs_srgb/w_1920,c_limit/7b53da44-6c68-4efa-8164-fcdb735c7b3c/as-sapatilhas-mais-memor%C3%A1veis-usadas-pelo-mj-em-the-last-dance.jpg', 'foto', '6'),
(now(), ' Hoje tem mais um dia de jogo aqui em casa, bora com tudo e bola pra frente', 'texto', '7'),
(now(), 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8S4bG6OLKZw_d9nzWDLSvIfBaxRlHjyHtmQ&s', 'meme', '8'),
(now(), 'Eu so tento ser o melhor Patrick Mahomes que eu posso ser, toda experiencia, oa ou ruim, vc tem que aprender com ela', 'texto', '9'),
(now(), 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhsSTnNkxYRDrpt_Z8wHWxQ8m9GP6_C78fAMwuXIr9Z93g0Lkqxf5ynKRTxLu_88jtL-kqFFjjYXXQc9HY5aAONB-Nfm88ZuY7yfcArLClSTmtjzFzkRg8P0gy8CA7tysOpnbXO4dpKxLo/s1600/Buraco.jpg', 'meme', '10');

insert into comentarios(comentario, postagem_referenciada_id, usuario_dono_do_comentario_id, data_do_comentario) values
('Ah...vai ser assim entao ne Nick? A gente ve isso mais tarde', '8', '7', now()),
('Ah ta, entao esse era o compromisso que vc tinha hoje, saquei', '1', '2', now()),
('que bontinha, cuidado que eu tbm tenho um e daqui pra frente e so ladeira a baixo', '1', '3', now()),
('Eita que agora eu fiquei interessado', '4', '5', now()),
('Rapaz to ate hoje querendo um desses, pena que n combina com o uniforme', '6', '9', now()),
('Jurava que a França ia leva essa, parabens Messi', '2', '8', now());

insert into comentarios(comentario, comentario_referenciado_id, usuario_dono_do_comentario_id, data_do_comentario) values
('Pois eu tbm jurava, so n posso dizer parabens >:(', '5', '4', now()),
('Eu tenho um kkkkk', '4', '7', now()),
('Nao foi so vc n, eu tbm fiquei lol', '3', '10', now()),
('Ele ja tinha um filho tbm mano', '2', '2', now());

insert into grupos(nome_do_grupo, descricao_do_grupo, data_de_criacao) values
('Os show de bola', 'Jogadores de footbol que marcaram a historia', now()),
('Bola na rede', 'Jogadores de baquete famosos', now()),
('Nos n temos FIFA', 'Jogadores que n ganharam uma copa do mundo', now()),
('Nos temo FIFA LOL :)', 'Jogadores que ganharam uma copa do mundo', now()),
('Vermelho e dez >:)', 'esportistas que usam vermelho', now()),
('Ceu dos esprtes', 'Esportistas que Deus ja levou', now());

insert into membros_do_grupo(id_do_grupo_referenciado, id_membros_do_grupo, funcao_do_membro) values
('1', '1', 'membro'),
('1', '2', 'membro'),
('1', '3', 'membro'),
('1', '4', 'membro'),
('1', '5', 'gerente'),
('2', '6', 'gerente'),
('2', '7', 'membro'),
('2', '8', 'membro'),
('3', '1', 'membro'),
('3', '3', 'gerente'),
('3', '4', 'membro'),
('4', '2', 'membro'),
('4', '5', 'gerente'),
('5', '9', 'membro'),
('5', '10', 'gerente'),
('6', '5', 'gerente'),
('6', '10', 'gerente');	

insert into tag(nome_da_tag) values
('Joga muito'),
('em memoria'),
('cade o teu fifa?'),
('eu tenho e vc n'),
('dono da rede'),
('te pego na curva'),
('this is america');

insert into tags_e_seus_usuarios_atribuidos(id_usuario_referenciado, id_tag_atribuida) values
('1', '1'),
('2', '1'),
('3', '1'),
('4', '1'),
('5', '1'),
('5', '2'),
('10', '2'),
('1', '3'),
('3', '3'),
('4', '3'),
('5', '4'),
('2', '4'),
('6', '5'),
('7', '5'),
('8', '5'),
('10', '6'),
('9', '7');

SELECT DISTINCT nome_usuario
FROM comentarios 
JOIN postagens  ON postagem_referenciada_id = id_postagem
JOIN usuario  ON usuario_dono_do_comentario_id = id_usuario
WHERE autor_da_postagem = 1;



SELECT 
    nome_do_grupo, 
    COUNT(id_membros_do_grupo) AS numero_de_membros
FROM 
    grupos 
LEFT JOIN 
    membros_do_grupo  ON id_grupo = id_do_grupo_referenciado
GROUP BY 
    nome_do_grupo;
    
    
    
    SELECT 
    nome_usuario, 
    data_nascimento 
FROM 
    usuario 
WHERE 
    data_nascimento > '1993-12-31';
    
    
    
    SELECT nome_usuario
FROM usuario 
JOIN membros_do_grupo  ON id_usuario = id_membros_do_grupo
JOIN grupos  ON id_do_grupo_referenciado = id_grupo
JOIN tags_e_seus_usuarios_atribuidos  ON id_usuario = id_usuario_referenciado
JOIN tag  ON id_tag_atribuida = id_tag
WHERE nome_do_grupo = 'Os show de bola'
  AND nome_da_tag = 'eu tenho e vc n';
  
  
  
  SELECT nome_usuario, COUNT(id_comentario) AS total_comentarios
FROM comentarios 
JOIN usuario  ON usuario_dono_do_comentario_id = id_usuario
GROUP BY nome_usuario
ORDER BY total_comentarios DESC
LIMIT 1;









