drop table Etudiant;

create table Etudiant (
  id number(38),
  nom varchar2(40) not null,
  prenom varchar2(40) not null,
  sexe number(1) not null check(sexe in (0, 1, 2, 9)),
  age number(3) not null,
  vivant number(1) default 1 not null check(vivant in (0, 1)),
  constraint pk_etudiant primary key (id),
  check (age >= 18 and age < 125)
);
