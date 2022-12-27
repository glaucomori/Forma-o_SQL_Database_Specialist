show databases;
use teste;

-- função para calcular regra de três de forma a ficar os números organizados da seguinte maneira:
--   numA       numB
--   x          numC
create function first_function (numA decimal(10,2), numB decimal(10,2), numC decimal(10,2))
	returns float deterministic
    return ((numA * numC) / numB);

select first_function(1, 119, 135);

drop function first_function;
