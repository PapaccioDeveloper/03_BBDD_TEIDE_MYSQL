/*Crear una base de datos llamada electro. */
CREATE database electro;
use electro;

/*  • Implementar las siguientes tablas con su relación. (El nombre del campo debe coincidir con el título de la columna y el tipo de datos estará en función del contenido de las mismas).
    • Deberéis introducir los siguientes datos en las tablas.
    
    TABLA TIENDA
*/
create table tienda(
idtienda int not null primary key auto_increment,
nombre varchar(25) not null,
ciudad varchar(25) not null,
num_trabajadores int not null,
superficie int not null
);

/* TABLA FRIGORIFICOS*/

create table frigorificos(
codigo int not null  primary key auto_increment,
marca varchar(20) not null,
modelo varchar(40) not null,
color varchar(25) not null,
capacidad smallint not null,
sistema varchar(25) not null,
altura smallint not null,
precio int not null,
idtienda int ,
constraint fk_frigorifico_tienda foreign key(idtienda) references tienda(idtienda)
);

/* INTRODUCIR DATOS EN LAS TABLAS */

insert into tienda
values(1,"ElectroSol","Madrid",5,1250),(2,"TotalFrigo","Madrid",8,1750),(3,"BarnaElectric","Barcelona",10,2000),(4,"FrigoDiaz","Barcelona",5,1000),(5,"FrigoElectric","Barcelona",15,3000);
select * from tienda;

insert into frigorificos(marca,modelo,color,capacidad,sistema,altura,precio,idtienda)
values("Balay","LRB3DE18S","Blanco",311,"Estático",178,1010,2),("Haier","RS650N4AC1","Inox",500,"No frost",110,179,2),("Balay","JF-90","Inox",90,"Estático",75,139,3),("AEG","RB34A7","Blanco",344,"No Frost",185,949,4),("Haier","OFX211","Negro",80,"Estático",80,129,1),("AEG","RCB632E5MX","Blanco",290,"No frost",186,799,2);
insert into frigorificos(marca,modelo,color,capacidad,sistema,altura,precio)
values("Balay","3FAF494XE","Inox",533,"No frost",179,1499);

select * from frigorificos; 

/* 1  Consulta que muestre todas las tiendas de menos de 1500 metros, ordenadas por el nombre de la tienda decreciente.*/
select * from tienda where superficie < 1500 order by nombre desc;

/* 2 Consulta que muestre la marca y el modelo de los frigoríficos que sean blancos y su capacidad sea superior a 300. */
select marca , modelo from frigorificos where color = "Blanco" and capacidad >= 300;

/* 3 Consulta que muestre el nombre de la tienda, la marca, el modelo y el precio del frigorífico.*/

select tienda.nombre , frigorificos.marca , frigorificos.modelo ,frigorificos.precio
from tienda
inner join frigorificos
on tienda.idtienda = frigorificos.idtienda;

/* 4 ¿Cuántos frigoríficos tenemos de cada marca?*/
select count(distinct marca) from frigorificos ;

/* 5 ¿Cuál es el importe total de los frigoríficos de cada tienda?*/
select SUM(precio) as 'Importe total de todos los frigorificos' from frigorificos; 

/*6 Mostrar la marca, modelo, precio, capacidad y la tienda de cada frigorífico. Si un frigorífico no está en ninguna tienda también debe salir. */

select tienda.nombre , frigorificos.marca , frigorificos.modelo ,frigorificos.precio, frigorificos.capacidad
from tienda
right join frigorificos
on tienda.idtienda = frigorificos.idtienda;

/* 7 Mostrar la media de precio de los frigoríficos de la marca Haier.*/
select AVG(precio) from frigorificos where marca = "Haier"; 

/*8 ¿Cuál es la media de capacidad y de precio de los frigoríficos con una altura superior a 180? */

select AVG(capacidad) as " Media capacidad", AVG(precio) as "Media Precios " from frigorificos where altura > 180;

/* 9 Mostrar la tienda y la suma del precio de sus frigoríficos, solo de aquellas tiendas que la suma del precio de sus frigoríficos es superior a 1500€ */
select tienda.nombre , sum(frigorificos.precio)
from tienda 
left join frigorificos on tienda.idtienda = frigorificos.idtienda 
group by tienda.nombre
having sum(frigorificos.precio) > 1500;

/* 10  Mostrar la marca y el modelo de los frigoríficos que no están en ninguna tienda.*/
select marca , modelo from frigorificos where idtienda is null;
select marca , modelo from frigorificos where not exists (select null from tienda where tienda.istienda = frigorificos.idtienda);

/* 11 Mostrar la marca, el modelo, el precio y una nueva columna con un 10% sobre el precio a la que llamaremos descuento de los frigoríficos de altura superior a 170 y un precio menor de 800€.*/
select marca , modelo ,precio , precio-(precio*0.1) as "Descuento frigorifico 10%" from frigorificos where altura > 170 and precio < 800;

/* 12 Marca y modelo del frigorífico de mayor capacidad.*/
select marca , modelo 
from frigorificos  
where capacidad =(
select max(capacidad) 
from frigorificos );

/* 13 Marca y modelos de los frigoríficos que tienen una capacidad superior al frigorífico de mayor capacidad de la marca AEG.*/
select marca , modelo 
from frigorificos
where capacidad > (select max(capacidad) 
from frigorificos where marca like "AEG");

/*14  Qué precio tiene el frigorífico con más capacidad que no es de color blanco ni de la marca AEG.*/
select precio
from frigorificos
where capacidad in( select max(capacidad) 
from frigorificos
where color <>("Blanco") and marca <> "AEG");


/*15 Crea una vista con todos los frigoríficos de las tiendas de Madrid. 
La vista mostrará el nombre de la tienda y todos los datos del frigorífico.
La vista se llamará Vistatiendamadrid. */

/*select *
from frigorificos 
where idtienda in (select idtienda from tienda where ciudad like "Madrid");
*/
create view Vistatiendamadrid as 
select frigorificos.* ,tienda.nombre 
from frigorificos 
right outer join tienda on frigorificos.idtienda = tienda.idtienda where ciudad like "Madrid";

/* comprobar Vistatiendamadrid */
select * from Vistatiendamadrid;

/* 16 Empieza una transacción con la instrucción BEGIN. 
Incrementa 50 € el precio de todos los frigoríficos de la marca Haier. 
Ejecuta un ROLLBACK. ¿Qué ha sucedido?*/

begin;
update frigorificos SET precio = (precio +50) where marca like "Haier";
select precio from frigorificos;

