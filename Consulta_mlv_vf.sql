select b."name" as "Modelo", c."name" as "Marca", d."name" as "Grupo", a.plate as "Matricula", a.dt_purchased as "Fecha compra", 
a.total_km as "Kilometros", a.num_policy as "Numero de poliza", e."name" as "Aseguradora",f."name" as "Color"
from practica2_sql_mlv.kc_cars a
inner join practica2_sql_mlv.car_model b on a.id_car_model  = b.id_car_model 
inner join practica2_sql_mlv.brand c on b.id_brand = c.id_brand 
inner join practica2_sql_mlv.brand_group d on c.id_brand_group = d.id_brand_group 
inner join practica2_sql_mlv.insurance_company e on a.id_insurance_company = e.id_insurance_company
inner join practica2_sql_mlv.colour f  on a.id_colour= f.id_colour
where a. dt_termination = '4000-01-01'
