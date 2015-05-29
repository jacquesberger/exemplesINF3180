drop table Etudiant;

create table Etudiant (
  id number(38),
  nom varchar2(40) not null,
  prenom varchar2(40) not null,
  sexe number(1) not null,
  age number(3) not null,
  constraint pk_etudiant primary key (id)
  check (sexe in (0, 1, 2, 9)),
  check (age >= 18 and age < 125)
);
