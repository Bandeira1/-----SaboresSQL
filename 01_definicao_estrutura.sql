
use  restaurante;

create table funcionarios(
	id_funcionario int auto_increment primary key,
    nome varchar(255) not null,
    cpf varchar(14),
    data_nascimento date,
    endereco varchar(255) not null,
    telefone varchar(15) not null,
    email varchar(100),
    cargo varchar(100),
    salario decimal(10,2),
    data_admissao date
);
create table clientes(
    id_cliente int auto_increment primary key,
    nome varchar(255) not null,
    cpf varchar(14) not null,
    data_nascimento date,
    endereco varchar(255),
    telefone varchar(15),
    email varchar(100),
    data_cadastro date
);

create table produtos(
    id_produto int auto_increment primary key,
    nome varchar(255),
    descricao text,
    preco decimal(10,2),
    categoria varchar(100)
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_funcionario INT,
    id_produto INT,
    quantidade INT,
    preco DECIMAL(10,2),
    data_pedido DATE,
    statu VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);


create table info_produtos(
    id_info int auto_increment primary key,
    id_produto int,
    foreign key (id_produto) references produtos(id_produto),
    ingredientes text,
    fornecedor varchar(255)
);



