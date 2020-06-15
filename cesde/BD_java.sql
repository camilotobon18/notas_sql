git remote set-url origin https://github.com/camilotobon18/MVC.git

para reiniciar las credenciales de git
cmdkey/delete:LegacyGeneric:target=git:https://github.com

use taller_cesde;
create table tipo_vehiculo(
    id int primary key,
    nomtv varchar(50) unique
);

create table vehiculo(
    placa varchar(6) primary key,
    marca varchar(50) not null,
    referencia varchar(50) not null,
    modelo int,
    id_tv int,
    foreign key(id_tv) references tipo_vehiculo(id)
);

create table tipo_conductor(
    id int primary key,
    nombre varchar(255)
);


create table ruta(
    id int primary key,
    nombre varchar(255),
    id_vehiculo varchar(6),
    foreign key(id_vehiculo) references vehiculo(placa)
);



alter table conductor(
    id int primary key,
    nombre varchar(255),
    tipo_licencia varchar(255),
    id_vehiculo varchar(6),
    id_tipo_conductor int,
    foreign key(id_vehiculo) references vehiculo(placa),
    foreign key(id_tipo_conductor) references tipo_conductor(id)
);

create table contrato(
    id int primary key,
    id_vehiculo varchar(6),
    id_conductor int,
    foreign key(id_vehiculo) references vehiculo(placa),
    foreign key(id_conductor) references conductor(id)
);

--modificar el tipo de dato de una tabla
alter table conductor modify id_vehiculo varchar(6)

--agregar algo nuevo a la tabla
alter table conductor add  foreign key(id_vehiculo) references vehiculo(placa)
