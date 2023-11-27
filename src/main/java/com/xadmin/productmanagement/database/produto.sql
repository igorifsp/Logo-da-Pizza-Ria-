CREATE DATABASE produto;
USE produto;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codProd INT unique,
    nome VARCHAR(255),
    descricao TEXT,
    marca VARCHAR(1000),
    estoque INT,
    preco DECIMAL(10, 2)
);

INSERT INTO products (codProd, nome, descricao, marca, estoque, preco) VALUES
    (2001, 'Mouse Gamer', 'Ajustável para jogos de 80 FPS', 'Multilaser', 50, 2399.99),
    (1001, 'Notebook XPS 13', 'Desempenho excepcional em um design compacto', 'Dell', 50, 2399.99),
    (1002, 'MacBook Air', 'Ultrafino e leve, perfeito para mobilidade', 'Apple', 30, 1299.99),
    (1003, 'ThinkPad X1 Carbon', 'Durabilidade e desempenho empresarial', 'Lenovo', 20, 1699.99),
    (1004, 'Surface Laptop 4', 'Elegância e potência na ponta dos seus dedos', 'Microsoft', 40, 1799.99),
    (1005, 'ROG Zephyrus G14', 'Desempenho incrível em um laptop gamer compacto', 'ASUS', 25, 1999.99),
    (1006, 'Latitude 9510', 'Conectividade avançada para profissionais em movimento', 'Dell', 35, 2899.99),
    (1008, 'ThinkBook 14s Yoga', 'Versatilidade e desempenho em um 2 em 1', 'Lenovo', 15, 1299.99),
    (1009, 'Surface Pro 7', 'Um tablet que pode substituir seu laptop', 'Microsoft', 28, 999.99),
    (1010, 'Inspiron 14', 'Desempenho confiável em um laptop acessível', 'Dell', 22, 699.99),
    (1011, 'ROG Strix G15', 'Experiência imersiva em jogos com alta performance', 'ASUS', 17, 2299.99),
    (1012, 'Yoga C940', 'Tela touchscreen e design premium para produtividade', 'Lenovo', 33, 1499.99),
    (1013, 'Surface Book 3', 'Versatilidade e desempenho em um 2 em 1 premium', 'Microsoft', 45, 2799.99),
    (1014, 'Alienware m15 R6', 'Potência e estilo em um laptop gamer', 'Dell', 19, 2999.99),
    (1015, 'MacBook Pro 16"', 'O poder da criatividade em um laptop', 'Apple', 27, 2399.99),
    (1016, 'Ideapad Gaming 3', 'Desempenho sólido para jogos a um preço acessível', 'Lenovo', 14, 1099.99),
    (1017, 'Vivobook S15', 'Design elegante e portátil para uso diário', 'ASUS', 23, 799.99),
    (1018, 'XPS 15', 'Desempenho excepcional em um laptop premium', 'Dell', 31, 2599.99),
    (1019, 'Surface Go 3', 'Portabilidade e versatilidade em um tablet compacto', 'Microsoft', 37, 499.99),
    (1020, 'MacBook Air M2', 'Ultrafino e poderoso para usuários exigentes', 'Apple', 11, 1499.99),
    (1021, 'TUF Gaming A15', 'Desempenho robusto para gamers', 'ASUS', 26, 1299.99),
    (1022, 'Legion 7i', 'Potência extrema para jogos intensivos', 'Lenovo', 29, 2799.99),
    (1023, 'Inspiron 15 3000', 'Valor e desempenho em um laptop acessível', 'Dell', 16, 599.99),
    (1024, 'Mac Mini', 'Compacto e poderoso para diversas aplicações', 'Apple', 38, 899.99),
    (1025, 'VivoBook Flip 14', 'Versatilidade em um laptop conversível', 'ASUS', 21, 849.99),
    (1026, 'Latitude 5420', 'Confiabilidade e segurança para uso corporativo', 'Dell', 34, 1499.99),
    (1027, 'ROG Flow Z13', 'Tablet para jogos com experiência única', 'ASUS', 42, 1999.99),
    (1028, 'IdeaCentre 5', 'Desempenho para produtividade em um desktop', 'Lenovo', 13, 799.99),
    (1029, 'Surface Studio 2', 'Criatividade sem limites em um computador all-in-one', 'Microsoft', 24, 3499.99),
    (1030, 'iMac 27"', 'Desempenho e design elegante em um desktop', 'Apple', 36, 2299.99);


select * from produtos