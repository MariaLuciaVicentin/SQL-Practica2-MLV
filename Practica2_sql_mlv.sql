--- Solucion de Maria Lucia Vicentin

--Creamos el esquema
create schema practica2_sql_mlv authorization njqtdlrk;

-- Grupo empresarial. Creo la tabla brand group de coches
create table practica2_sql_mlv.brand_group(
	id_brand_group SERIAL not null, --PK autonumerico 
	name varchar(200) not null,
	description varchar(512) null
);

---PK
alter table practica2_sql_mlv.brand_group
add constraint brand_group_PK primary key (id_brand_group);

---DATOS  
insert into practica2_sql_mlv.brand_group (name, description) values ('VAN','');
insert into practica2_sql_mlv.brand_group (name, description) values ('RENAULT','');

--Marcas. Creo la tabla brand de coches
create table practica2_sql_mlv.brand(
	id_brand SERIAL not null, --PK autonumerico 
	name varchar(200) not null,
	id_brand_group int not null, --FK
	description varchar(512) null
);

--PK y FK
alter table practica2_sql_mlv.brand
add constraint brand_PK primary key (id_brand);

alter table practica2_sql_mlv.brand
add constraint brand_group_FK foreign key (id_brand_group) 
references practica2_sql_mlv.brand_group (id_brand_group);

--DATOS
insert into practica2_sql_mlv.brand (name, id_brand_group) values ('VW',1);
insert into practica2_sql_mlv.brand (name, id_brand_group) values ('Audi',1);
insert into practica2_sql_mlv.brand (name, id_brand_group) values ('Seat',1);
insert into practica2_sql_mlv.brand (name, id_brand_group) values ('Skoda',1);

insert into practica2_sql_mlv.brand (name, id_brand_group) values ('Renault',2);
insert into practica2_sql_mlv.brand (name, id_brand_group) values ('Nissan',2);

--Modelos. Creo la tabla modelos de coches
create table practica2_sql_mlv.car_model(
	id_car_model SERIAL not null, --PK autonumerico 
	name varchar(200) not null,
	id_brand int not null, --FK
	description varchar(512) null,
	commercialization_start_dt date not null,
	commercialization_end_dt date null default '4000-01-01'
);

--PK y FK
alter table practica2_sql_mlv.car_model
add constraint car_model_PK primary key (id_car_model);

alter table practica2_sql_mlv.car_model
add constraint brand_FK foreign key (id_brand) 
references practica2_sql_mlv.brand (id_brand);

--DATOS
insert into practica2_sql_mlv.car_model (name, id_brand, commercialization_start_dt) values ('Golf',1,'1980-01-01');
insert into practica2_sql_mlv.car_model (name, id_brand, commercialization_start_dt) values ('Passat',1,'1980-01-01');
insert into practica2_sql_mlv.car_model (name, id_brand, commercialization_start_dt) values ('A6',2,'2010-01-01');
insert into practica2_sql_mlv.car_model (name, id_brand, commercialization_start_dt) values ('A5',2,'2010-01-01');
insert into practica2_sql_mlv.car_model (name, id_brand, commercialization_start_dt) values ('A3',2,'2010-01-01');
insert into practica2_sql_mlv.car_model (name, id_brand, commercialization_start_dt) values ('A2',2,'2010-01-01');
insert into practica2_sql_mlv.car_model (name, id_brand, commercialization_start_dt) values ('A1',2,'2010-01-01');
insert into practica2_sql_mlv.car_model (name, id_brand, commercialization_start_dt) values ('A1',2,'2010-01-01');

insert into practica2_sql_mlv.car_model (name, id_brand, commercialization_start_dt) values ('Scenic',5,'1995-01-01');
insert into practica2_sql_mlv.car_model (name, id_brand, commercialization_start_dt) values ('Laguna',5,'1995-01-01');

insert into practica2_sql_mlv.car_model (name, id_brand, commercialization_start_dt) values ('Xtrait',6,'2005-01-01');
insert into practica2_sql_mlv.car_model (name, id_brand, commercialization_start_dt) values ('Micra',6,'2005-01-01');
insert into practica2_sql_mlv.car_model (name, id_brand, commercialization_start_dt) values ('Quaqai',6,'2005-01-01');

--Colores de coches
create table practica2_sql_mlv.colour(
	id_colour SERIAL not null, --PK autonumerico 
	name varchar(200) not null
);

---PK
alter table practica2_sql_mlv.colour
add constraint colour_PK primary key (id_colour);

--DATA
insert into practica2_sql_mlv.colour (name) values ('Blanco');
insert into practica2_sql_mlv.colour (name) values ('Negro');
insert into practica2_sql_mlv.colour (name) values ('Rojo');
insert into practica2_sql_mlv.colour (name) values ('Azul');
insert into practica2_sql_mlv.colour (name) values ('Verde');

--Empresas de seguro
create table practica2_sql_mlv.insurance_company(
	id_insurance_company SERIAL not null, --PK autonumerico 
	name varchar(200) not null
);
---PK
alter table practica2_sql_mlv.insurance_company
add constraint insurance_company_PK primary key (id_insurance_company);

--DATA
insert into practica2_sql_mlv.insurance_company (name) values ('Axa');
insert into practica2_sql_mlv.insurance_company (name) values ('Mutua Madrileña');
insert into practica2_sql_mlv.insurance_company (name) values ('Mapfre');

--Currency
create table practica2_sql_mlv.currency(
	id_currency varchar(10) not null, --PK 
	name varchar(200) not null
);

---PK
alter table practica2_sql_mlv.currency
add constraint currency_PK primary key (id_currency);

--DATA
insert into practica2_sql_mlv.currency (id_currency, name) values ('EUR','Euro');
insert into practica2_sql_mlv.currency (id_currency, name) values ('DOL','Dolar Americano');

--Coches de empresa
create table practica2_sql_mlv.kc_cars(
	id_car SERIAL not null, --PK 
	id_car_model int not null,---FK 
	dt_purchased date not null,
	dt_termination date null default '4000-01-01',
	plate varchar(20) not null,
	id_colour int not null,  --FK  
	total_km int null default 0,
	id_insurance_company int not null,--FK 
	num_policy varchar (100) not null,
	description text null
);

---PK
alter table practica2_sql_mlv.kc_cars
add constraint cars_kc_PK primary key (id_car);

---FK
alter table practica2_sql_mlv.kc_cars
add constraint car_model_FK foreign key (id_car_model) 
references practica2_sql_mlv.car_model (id_car_model);

alter table practica2_sql_mlv.kc_cars
add constraint colourl_FK foreign key (id_colour) 
references practica2_sql_mlv.colour (id_colour);

alter table practica2_sql_mlv.kc_cars
add constraint insurance_FK foreign key (id_insurance_company) 
references practica2_sql_mlv.insurance_company (id_insurance_company);

--Datos
insert into practica2_sql_mlv.kc_cars (id_car_model, dt_purchased, plate, id_colour, total_km, id_insurance_company, num_policy) 
values (10,'2022-08-01', '2233LKS', 2, 850, 1, '123456kdfgj');
insert into practica2_sql_mlv.kc_cars (id_car_model, dt_purchased, plate, id_colour, total_km, id_insurance_company, num_policy) 
values (1,'2021-08-01', '4833KIN', 1, 1850, 2, '897sndjasd');
insert into practica2_sql_mlv.kc_cars (id_car_model, dt_purchased, plate, id_colour, total_km, id_insurance_company, num_policy) 
values (3,'2020-08-01', '9833KIS', 3, 23850, 3, '87nhsgy654');
insert into practica2_sql_mlv.kc_cars (id_car_model, dt_purchased, plate, id_colour, total_km, id_insurance_company, num_policy) 
values (6,'2019-08-01', '6533JNM', 4, 4850, 1, '98nsahdga768');

--Revisiones de un coche
create table practica2_sql_mlv.car_revision(
	id_car int not null, --PK , FK
	revision_dt date not null,---PK 
	revision_cost decimal not null,
	id_currency varchar(10) not null,--FK
	revision_km int not null,
	description text null
);

---PK
alter table practica2_sql_mlv.car_revision
add constraint revision_car_PK primary key (id_car, revision_dt); -- 2 primary key

---FK
alter table practica2_sql_mlv.car_revision
add constraint kc_car_revision_FK foreign key (id_car) 
references practica2_sql_mlv.kc_cars (id_car);

alter table practica2_sql_mlv.car_revision
add constraint currency_FK foreign key (id_currency) 
references practica2_sql_mlv.currency (id_currency);

--DATOS 
insert into practica2_sql_mlv.car_revision 
values (1,'2022-10-01',245.5,'EUR',1000,'Primera revision');

insert into practica2_sql_mlv.car_revision 
values (2,'2022-10-01',245.5,'EUR',2000,'Primera revision');
insert into practica2_sql_mlv.car_revision 
values (2,'2022-11-01',345.5,'EUR',3000,'Segunda revision');

insert into practica2_sql_mlv.car_revision 
values (3,'2022-11-01',345.5,'EUR',4000,'Primera revision');
insert into practica2_sql_mlv.car_revision 
values (3,'2022-12-01',445.5,'EUR',5000,'Segunda revision');

