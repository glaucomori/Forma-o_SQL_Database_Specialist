use ecommerce;
show tables;
select * from provider_has_product;

-- Exibir identificação do produto e sua descrição, para os produtos das categorias: Informátia e Eletrônicos.
select idProduct, productDescription as Produto from product where productCategory = 'Informática' or productCategory = 'Eletrônicos';

-- Exibir a quantidade de clientes por estado.
select state as Estado, count(state) as Quantidade_de_clientes_no_estado from address group by state order by Quantidade_de_clientes_no_estado;

-- Exibir os produtos que são disponibilizados pelo fornecedor em menos de 30 dias.
select p.productDescription as Produto, pp.providerLeadtime as Leadtime, pro.providerName as Fornecedor
		from product as p
        inner join provider_has_product as pp using (idProduct)
        inner join provider as pro using (idProvider)
        having Leadtime < 30
        order by Leadtime
        ; 

-- Exibir a quantidade nos estoques dos produtos de cada categoria. Organizando do menor para o maior.
select p.productCategory as Categoria, 
		i.inventoryDescription as Estoque, 
        sum(ip.inventoryQuantity) as Quantidade 
        from product as p 
        inner join inventory_has_product as ip on p.idProduct = ip.idProduct
        inner join inventory as i on ip.idInventory = i.idInventory
        group by Categoria
        order by Quantidade
        ;

-- Exibir os valores subtotais dos produtos nos pedidos.
select o.idOrder, p.idProduct,
		p.productDescription as Produto,
        p.price as Preço_unitário,
        op.quantity as Quantidade,
        (p.price * op.quantity) as Subtotal
        from orders as o
        inner join orders_has_product as op using (idOrder)
		inner join product as p using (idProduct)
        order by Subtotal
        ;

-- Exibir tabela com os segunites dados: fornecedor, produtos atendidos, quantidade disponível, prazo para disponibilização.
select pr.providerName as Fornecedor,
		po.productDescription as Produtos_atendidos,
        pp.providerQuantity as Quantidade_disponível,
        pp.providerLeadtime as Prazo_para_disponibilização
		from provider as pr
        inner join provider_has_product as pp using (idProvider)
        inner join product as po using (idProduct)
		;

-- Exibir tabela com os seguintes dados: produto, local no estoque, quantidade no estoque, fornecedor, quantidade no fornecedor, vendedor, quantidade no vendedor.
select p.idProduct, p.productDescription as Produto,
		i.inventoryDescription as Local_no_estoque,
        ip.inventoryQuantity as Quantidade_no_estoque,
        pr.providerName as Fornecedor,
        pp.providerQuantity as Quantidade_no_fornecedor,
        s.sellerName as Vendedor,
        sp.quantity as Quantidade_no_vendedor
        from product as p
        inner join inventory_has_product as ip using (idProduct)
        inner join inventory as i using (idInventory)
        inner join provider_has_product as pp using (idProduct)
        inner join provider as pr using (idProvider)
        inner join seller_has_product as sp using (idProduct)
        inner join seller as s using (idSeller)
        order by idProduct
        ;

-- Exibir tabela com os seguintes dados: cliente, produto, preço unitário, quantidade, subtotal, frete e valor total.
select concat(c.Fname, ' ', c.Lname) as Cliente,
		p.productDescription as Produto,
        p.price as Preço_unitário,
        op.quantity as Quantidade,
        (p.price * op.quantity) as Subtotal,
        d.shipping as Frete,
        o.total as Valor_Total
        from clients as c
        inner join orders as o using (idClient)
        inner join orders_has_product as op using (idOrder)
		inner join product as p using (idProduct)
        inner join delivery as d using (idDelivery)
        ;

-- Quantos pedidos foram feitos por cada cliente?
select c.idClient, 
		concat(c.Fname, ' ', c.Lname) as Cliente,
        count(o.idClient) as quantidade_de_pedidos 
		from clients as c 
        left join orders as o on c.idClient = o.idClient
        group by c.idClient
        order by c.idClient
        ;

-- Algum vendedor também é fornecedor?
select * from seller as s, provider as p where s.sellerCNPJ = p.providerCNPJ;

-- Relação de produtos fornecedores e estoques;
select p.productDescription as produto,
		pr.providerName as fornecedor,
        pp.providerQuantity as quantidade_fornecedor,
        i.inventoryDescription as estoque,
        ip.inventoryQuantity as quantidade_estoque
        from product as p
        inner join provider_has_product as pp using (idProduct)
        inner join provider as pr using (idProvider)
        inner join inventory_has_product as ip using (idProduct)
        inner join inventory as i using (idInventory)
        ;

-- Relação de nomes dos fornecedores e nomes dos produtos;
select p.providerName as fornecedor, 
		pr.productDescription as produto 
        from provider as p 
        inner join provider_has_product as pp using (idProvider)
        inner join product as pr using (idProduct)
        ;