/* Relacionar todas as IES */ 
SELECT DISTINCT t1.co_ies, t2.nome_ies
FROM censo.fato AS t1
INNER JOIN censo.ies AS t2
ON t1.co_ies = t2.co_ies;

/* Contar todas as IES */ 
SELECT COUNT(DISTINCT t1.co_ies) AS total_co_ies
FROM censo.fato AS t1
INNER JOIN censo.ies AS t2
ON t1.co_ies = t2.co_ies;

SELECT 
    ies.nome_ies, 
    curso.no_cine_rotulo, 
    categ_adm.nome_categ_administrativa, 
    mod_ens.descr_mod_ensino, 
    org_acad.descr_org_academica, 
    regiao.nome_uf, 
    grau_acad.nome_tp_grau_academico,
    aluno.qt_mat,
    aluno.qt_conc    
FROM censo.fato AS fato
LEFT JOIN censo.ies AS ies 
    ON fato.co_ies = ies.co_ies
LEFT JOIN censo.curso AS curso 
    ON fato.co_curso = curso.co_curso
LEFT JOIN censo.categ_administrativa_curso_ies AS categ_adm 
    ON fato.id_categ_administrativa = categ_adm.id_categ_administrativa
LEFT JOIN censo.mod_ensino_curso AS mod_ens 
    ON fato.id_mod_ensino = mod_ens.id_mod_ensino
LEFT JOIN censo.org_academica_curso_ies AS org_acad 
    ON fato.id_org_academica = org_acad.id_org_academica
LEFT JOIN censo.regiao_geografica_curso AS regiao 
    ON fato.co_uf = regiao.co_uf
LEFT JOIN censo.tp_grau_academico_curso_ies AS grau_acad
    ON fato.id_tp_grau_academico = grau_acad.id_tp_grau_academico
LEFT JOIN censo.aluno_curso AS aluno
    ON fato.co_curso = aluno.co_curso
WHERE ies.nome_ies = "Faculdade de Tecnologia e Inovação Senac DF";