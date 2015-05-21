drop table album;
drop table artiste;
drop table maison_disque;

create table artiste (
  id number,
  nom varchar2(255),
  est_solo number(1),
  constraint pk_artiste primary key (id)
);

create table maison_disque (
  id number,
  nom varchar2(255),
  constraint pk_maison_disque primary key (id)
);

create table album (
  id number,
  titre varchar2(255),
  annee number(4),
  artiste_id number,
  maison_disque_id number,
  constraint pk_albums primary key (id),
  constraint fk_albums_artiste foreign key (artiste_id) references artiste(id),
  constraint fk_albums_maison_disque foreign key (maison_disque_id) references maison_disque(id)
);
