drop table albums;

create table albums (
  artiste varchar2(100),
  titre varchar2(200),
  annee number,
  commentaire varchar2(300),
  note number
);

insert into albums values('Michael Jackson', 'Thriller', 1982, 'Un classique', 5);
insert into albums values('Michael Jackson', 'Bad', 1987, '5 ans pour un deuxieme album?!!?', 5);
insert into albums values('Michael Jackson', 'Dangerous', 1991, 'Moins excellent, mais bon quand meme', 4);
insert into albums values('Michael Buble', 'Call Me Irresponsible', 2007, '', 4);
insert into albums values('Michael Buble', 'Crazy Love', 2009, 'Rien a dire', 3);
