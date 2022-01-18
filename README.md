# 03_BBDD_TEIDE_MYSQL-ACT03
Caso práctico II de lenguajes SQL: DML y DDL.



    1. Tiendas de electrodomésticos. 

    • Crear una base de datos llamada electro. 
    • Implementar las siguientes tablas con su relación. (El nombre del campo debe coincidir con el título de la columna y el tipo de datos estará en función del contenido de las mismas).
    • Deberéis introducir los siguientes datos en las tablas.

Tabla: tienda 

idtienda     nombre         ciudad         um_trabajadores        superficie
1         ElectroSol        Madrid                5                  1250
2         TotalFrigo        Madrid                8                  1750
3       BarnaElectric     Barcelona               10                 2000 
4         FrigoDiaz       Barcelona               5                  1000
5 FrigoElectric Barcelona 15 3000

Tabla: frigorificos
Codigo       marca       modelo      color       capacidad      sistema       altura      precio      idtienda
1           Haier    HTR3619ENMN     Inox          348        No frost       190          619            1
2           Balay     LRB3DE18S      Blanco        311        Estático       178          1010           2
3           Haier     RS650N4AC1     Inox          500        No frost       110          179            2
4           Balay     JF-90          Inox           90        Estático        75          139            3
5           AEG       RB34A7         Blanco        344        No Frost       185          949            4   
6           Haier     OFX211         Negro          80        Estático        80          129            1
7           AEG       RCB632E5MX     Blanco        290        No frost       186          799            2
8           Balay     3FAF494XE      Inox          533        No frost       179          1499




    1. Consulta que muestre todas las tiendas de menos de 1500 metros, ordenadas por el nombre de la tienda decreciente.

    2. Consulta que muestre la marca y el modelo de los frigoríficos que sean blancos y su capacidad sea superior a 300.
    
    3. Consulta que muestre el nombre de la tienda, la marca, el modelo y el precio del frigorífico.
    
    4. ¿Cuántos frigoríficos tenemos de cada marca?

    5. ¿Cuál es el importe total de los frigoríficos de cada tienda?

    6. Mostrar la marca, modelo, precio, capacidad y la tienda de cada frigorífico. Si un frigorífico no está en ninguna tienda también debe salir.

    7. Mostrar la media de precio de los frigoríficos de la marca Haier.

    8. ¿Cuál es la media de capacidad y de precio de los frigoríficos con una altura superior a 180?

    9. Mostrar la tienda y la suma del precio de sus frigoríficos, solo de aquellas tiendas que la suma del precio de sus frigoríficos es superior a 1500€

    10. Mostrar la marca y el modelo de los frigoríficos que no están en ninguna tienda.

    11. Mostrar la marca, el modelo, el precio y una nueva columna con un 10% sobre el precio a la que llamaremos descuento de los frigoríficos de altura superior a 170 y un precio menor de 800€.

    12. Marca y modelo del frigorífico de mayor capacidad.

    13. Marca y modelos de los frigoríficos que tienen una capacidad superior al frigorífico de mayor capacidad de la marca AEG.

    14. Qué precio tiene el frigorífico con más capacidad que no es de color blanco ni de la marca AEG.

    15. Crea una vista con todos los frigoríficos de las tiendas de Madrid. La vista mostrará el nombre de la tienda y todos los datos del frigorífico. La vista se llamará Vistatiendamadrid.
       
    16. Empieza una transacción con la instrucción BEGIN. Incrementa 50 € el precio de todos los frigoríficos de la marca Haier. Ejecuta un ROLLBACK. ¿Qué ha sucedido?
    
  17. Empieza una transacción con la instrucción BEGIN. Incrementa 50€ el precio de todos los frigoríficos de la marca AEG. Ejecuta un COMMIT. ¿Qué ha sucedido?
