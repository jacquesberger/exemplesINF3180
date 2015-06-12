drop sequence album_seq;
drop sequence artiste_seq;
drop sequence maison_disque_seq;
drop table album;
drop table artiste;
drop table maison_disque;

create table artiste (
  id number,
  nom varchar2(25),
  est_solo number(1),
  nombre_individus number(2),
  constraint pk_artiste primary key (id)
);

create table maison_disque (
  id number,
  nom varchar2(25),
  constraint pk_maison_disque primary key (id)
);

create table album (
  id number,
  titre varchar2(25),
  annee number(4),
  artiste_id number,
  maison_disque_id number,
  constraint pk_albums primary key (id),
  constraint fk_albums_artiste foreign key (artiste_id) references artiste(id),
  constraint fk_albums_maison_disque foreign key (maison_disque_id) references maison_disque(id)
);

insert into artiste values (1, 'Michael Jackson', 1, 1);
insert into artiste values (2, 'Michael Buble', 1, 1);
insert into artiste values (3, 'Elvis Presley', 1, 1);
insert into artiste values (4, 'Iron Maiden', 0, 6);
insert into artiste values (5, 'Metallica', 0, 4);
insert into artiste values (6, 'The Sweet Database', 0, 9);
insert into artiste values (7, 'Computing Gods', 0, 3);

insert into maison_disque values (1, 'Century Media');
insert into maison_disque values (2, 'Nuclear Blast');
insert into maison_disque values (3, 'Magic Geni');

insert into album values (1, 'Thriller', 1982, 1, 1);
insert into album values (2, 'Xscape', 2014, 1, 1);
insert into album values (3, 'Bad', 1987, 1, 1);
insert into album values (4, 'Dangerous', 1991, 1, 1);
insert into album values (5, 'Invincible', 2001, 1, 2);
insert into album values (6, 'Immortal', 2011, 1, 1);
insert into album values (7, 'To Be Loved', 2013, 2, 1);
insert into album values (8, 'Christmas', 2011, 2, 1);
insert into album values (9, 'Crazy Love', 2009, 2, 1);
insert into album values (10, 'Today', 1975, 3, 1);
insert into album values (11, 'Promised Land', 1975, 3, 1);
insert into album values (12, 'Fear Of The Dark', 1992, 4, 2);
insert into album values (13, 'Killers', 1981, 4, 2);
insert into album values (14, 'Piece of Mind', 1983, 4, 2);
insert into album values (15, 'Powerslave', 1984, 4, 2);
insert into album values (16, 'Metallica', 1991, 5, 2);

create sequence artiste_seq start with 8;
create sequence maison_disque_seq start with 4;
create sequence album_seq start with 17;
