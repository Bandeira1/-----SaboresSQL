use restaurante;

select * from clientes;
select * from funcionarios;
select * from pedidos;
select * from produtos;
select * from info_produtos;

create view resumo_pedido as 
select p.id_pedido,
       p.quantidade,
       p.data_pedido,
       c.nome as nome_cliente,
       c.email,
       f.nome as nome_funcionario,
       pr.nome as nome_produto,
       pr.preco
from pedidos p
join clientes c on c.id_cliente = p.id_cliente
join funcionarios f on f.id_funcionario = p.id_funcionario
join produtos pr on pr.id_produto = p.id_produto ;

select id_pedido, nome_cliente, quantidade * preco as total_pedido from resumo_pedido;

create or replace view resumo_pedido as 
select p.id_pedido,
       p.quantidade,
       p.data_pedido,
       c.nome as nome_cliente,
       c.email,
       f.nome as nome_funcionario,
       pr.nome as nome_produto,
       pr.preco,
       p.quantidade * pr.preco as total
from pedidos p
join clientes c on c.id_cliente = p.id_cliente
join funcionarios f on f.id_funcionario = p.id_funcionario
join produtos pr on pr.id_produto = p.id_produto;

select id_pedido, nome_cliente, total  from resumo_pedido;

EXPLAIN
SELECT 
    id_pedido,
    nome_cliente,
    total
FROM resumo_pedido;	

-- FUNCTIONN
DELIMITER //
create function BuscaIngredientesProdutos(produtoID int)
returns text
reads sql data
begin
   declare ingredientesRetornados text;
   select ingredientes into ingredientesRetornados from info_produtos where id_produto = produtoID;
   return ingredientesRetornados;
end //
DELIMITER ;
select BuscaIngredientesProdutos(10);

DELIMITER //

create function mediaPedido(pedidoID INT) 
returns varchar(200)
reads sql data
BEGIN
    DECLARE totalPedido DECIMAL(10,2);
    DECLARE mediaGeral DECIMAL(10,2);
    DECLARE mensagem VARCHAR(200);

    -- Calcula o total do pedido específico
    select SUM(p.quantidade * pr.preco)
    into totalPedido
    from pedidos p
    join produtos pr ON p.id_produto = pr.id_produto  -- Verifique se o nome da coluna está certo
    where p.id_pedido = pedidoID;

    -- Calcula a média de todos os pedidos
    SELECT AVG(total_pedido) 
    INTO mediaGeral
    FROM (
        select p.id_pedido, SUM(p.quantidade * pr.preco) AS total_pedido
        from pedidos p
        join produtos pr ON p.id_produto = pr.id_produto
        GROUP BY p.id_pedido
    ) AS subconsulta;

    -- Compara o total do pedido com a média
    IF totalPedido > mediaGeral THEN
        SET mensagem = CONCAT('O total do pedido é acima da média: R$ ', totalPedido);
    ELSEIF totalPedido < mediaGeral THEN
        SET mensagem = CONCAT('O total do pedido é abaixo da média: R$ ', totalPedido);
    ELSE
        SET mensagem = CONCAT('O total do pedido é igual à média: R$ ', totalPedido);
    END IF;

    return mensagem;
end;
//

DELIMITER ;

select mediaPedido(5);
select mediaPedido(6);




