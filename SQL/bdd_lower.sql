#------------------------------------------------------------
#        script mysql.
#------------------------------------------------------------


#------------------------------------------------------------
# table: serie
#------------------------------------------------------------

create table serie(
        id        int (11) auto_increment  not null ,
        id_niveau int not null ,
        id_ville  int not null ,
        primary key (id )
)engine=innodb;


#------------------------------------------------------------
# table: ville
#------------------------------------------------------------

create table ville(
        id        int (11) auto_increment  not null ,
        nom       varchar (25) not null ,
        longitude varchar (52) not null ,
        latitude  varchar (52) not null ,
        primary key (id )
)engine=innodb;


#------------------------------------------------------------
# table: niveau
#------------------------------------------------------------

create table niveau(
        id         int (11) auto_increment  not null ,
        nom        varchar (25) not null ,
        nbr_photos int not null ,
        primary key (id )
)engine=innodb;


#------------------------------------------------------------
# table: photo
#------------------------------------------------------------

create table photo(
        id        int (11) auto_increment  not null ,
        url       varchar (500) not null ,
        longitude varchar (250) not null ,
        latitude  varchar (250) not null ,
        id_ville  int not null ,
        primary key (id )
)engine=innodb;


#------------------------------------------------------------
# table: score
#------------------------------------------------------------

create table score(
        id       int (11) auto_increment  not null ,
        pseudo   varchar (250) ,
        nombre   int not null ,
        id_serie int not null ,
        primary key (id )
)engine=innodb;


#------------------------------------------------------------
# table: user
#------------------------------------------------------------

create table user(
        id          int (11) auto_increment  not null ,
        identifiant varchar (250) not null ,
        password    varchar (250) not null ,
        mail        varchar (250) ,
        primary key (id )
)engine=innodb;

alter table serie add constraint fk_serie_id_niveau foreign key (id_niveau) references niveau(id);
alter table serie add constraint fk_serie_id_ville foreign key (id_ville) references ville(id);
alter table photo add constraint fk_photo_id_ville foreign key (id_ville) references ville(id);
alter table score add constraint fk_score_id_serie foreign key (id_serie) references serie(id);
