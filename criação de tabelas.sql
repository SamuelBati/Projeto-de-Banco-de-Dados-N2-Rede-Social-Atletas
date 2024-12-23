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