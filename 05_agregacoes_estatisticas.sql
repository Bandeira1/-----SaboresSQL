use restaurante;

select sum(quantidade) from pedidos; -- quantidade de pedidos

SELECT COUNT(DISTINCT id_cliente) AS clientes_unicos -- clientes unicos
FROM pedidos;

select avg(preco) from produtos;

select max(preco) from produtos;
select min(preco) from produtos;

SELECT nome, preco
FROM (
    SELECT 
        nome, 
        preco, 
        DENSE_RANK() OVER (ORDER BY preco DESC) AS ranking
    FROM produtos
) AS sub
WHERE ranking <= 5;

select avg(preco) as preco_medio from produtos group by categoria;

SELECT fornecedor, COUNT(id_produto) AS quantidade_produtos FROM  info_produtos group by fornecedor;

SELECT fornecedor,COUNT(*) AS quantidade_produtos from info_produtos group by fornecedor HAVING COUNT(*) > 1 ORDER BY quantidade_produtos DESC;

SELECT id_cliente, count(*) as unico_pedido from pedidos group by id_cliente having count(*) < 2;



  
  



  
