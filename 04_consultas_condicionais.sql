use restaurante;

select * from pedidos where id_funcionario = 4 and statu ='pendente';

select * from pedidos where statu <> 'concluido';

select * from pedidos where id_produto in (1,3,5,7,8);

select nome from clientes where nome like 'c%';

select * from info_produtos where ingredientes like '%carne%' or ingredientes like'%frango%';

SELECT * FROM produtos
WHERE preco BETWEEN 20 AND 30;

UPDATE pedidos
SET statu = NULL
WHERE id_pedido = 6;

SELECT * FROM pedidos
WHERE statu IS NULL;

SELECT 
  id_pedido,
  COALESCE(statu, 'Cancelado') AS statu
FROM pedidos;

SELECT 
  nome,
  cargo,
  salario,
  CASE 
    WHEN salario > 3000 THEN 'Acima da média'
    ELSE 'Abaixo da média'
  END AS media_salario
FROM funcionarios;






