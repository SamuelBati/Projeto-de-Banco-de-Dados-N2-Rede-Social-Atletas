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
