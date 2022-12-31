use oficina;
show tables;
select * from service_order;

-- Exibir todas as ordens de serviço com data de emissão em Setembro/2022.
select * from service_order where issueDate between '2022-09-01' and '2022-09-30';

-- Calcular o valor total de cada ordem de serviço descriminando os valores das peças e da mão de obra.
select so.idSO as OS,
	sum(pa.unitValue) as subtotal_peça,
    sum(mp.unitValue) as subtotal_MO,
    sum(pa.unitValue) + sum(mp.unitValue) as Valor_total
	from service_order as so
    inner join so_has_service as sos using (idSO)
    inner join service_has_parts using (idService)
    inner join parts as pa using (idParts)
    inner join so_has_manpower as sm using (idSO)
    inner join manpower as mp using (idManpower)
    group by OS
    order by OS
    ;

-- Exibir as ordens de serviço cujo valor total foi superior a R$ 1.000,00, começando pelas ordens de maior valor.
select so.idSO as OS,
    sum(pa.unitValue) + sum(mp.unitValue) as Valor_total
	from service_order as so
    inner join so_has_service as sos using (idSO)
    inner join service_has_parts using (idService)
    inner join parts as pa using (idParts)
    inner join so_has_manpower as sm using (idSO)
    inner join manpower as mp using (idManpower)
    group by OS
    having Valor_total > 1000
    order by Valor_total desc
    ;

-- Exibir relação dos clientes e seus veículos
select concat(c.Fname, ' ', c.Surname) as Clientes,
	concat(v.vehicleDescription, ' ', v.modelYear) as Veículos,
    v.plate as Placa
    from clients as c 
    inner join vehicle as v using (idClient)
    order by Clientes asc
    ;

-- Exibir quantidades de ordens canceladas emitidas em Outubro/2022
select count(*) as Ordens_canceladas from service_order where serviceStatus = 'Cancelado' and issueDate between '2022-10-01' and '2022-10-31';

-- Exibir relação de quais veículos cada trabalhador atuou entre Setembro/2022 e Outubro/2022
select concat(w.Fname, ' ', w.Surname) as Trabalhador, 
	concat(v.vehicleDescription, ' ', v.modelYear) as Veículo,
    v.plate as Placa,
    so.issueDate as Data_de_entrada
    from worker as w
    inner join team using (idTeam)
    inner join service using (idTeam)
    inner join so_has_service using (idService)
    inner join service_order as so using (idSO)
    inner join vehicle as v using (idVehicle)
    having so.issueDate between '2022-09-01' and '2022-10-31'
    order by Trabalhador asc
    ;
