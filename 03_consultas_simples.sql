use restaurante;

select nome, categoria from produtos where preco >30;

select nome, telefone, data_nascimento from clientes where data_nascimento <='1985-12-31';

select id_produto, ingredientes from info_produtos where ingredientes like 'carne%';

select nome, categoria from produtos order by categoria asc, nome asc;

select * from produtos;

select nome, preco from produtos order by preco desc,nome desc limit 5;
SELECT nome, preco FROM produtos WHERE categoria = 'Prato Principal' ORDER BY nome ASC LIMIT 2 OFFSET 6;

create table backup_pedidos as select * from  pedidos;




