drop table Telephone;
drop table Etudiant;

create table Etudiant (
  id number(38),
  nom varchar2(40) not null,
  prenom varchar2(40) not null,
  sexe number(1) not null check(sexe in (0, 1, 2, 9)),
  age number(3) not null,
  vivant number(1) default 1 not null check(vivant in (0, 1)),
  code_permanent varchar2(12) not null,
  constraint pk_etudiant primary key (id),
  check (age >= 18 and age < 125),
  unique(code_permanent),
  unique(nom, prenom)
);

create table Telephone (
  id number(38),
  numero varchar2(10) not null,
  etudiant_id number(38) not null,
  descriptif varchar2(8) default 'Domicile' not null,
  constraint pk_telephone primary key (id),
  constraint fk_telephone_etudiant foreign key etudiant_id references Etudiant(id),
  constraint c_longueur_telephone check(length(numero) = 10),
  constraint c_descriptif check(descriptif in ('Domicile', 'Mobile', 'Travail'))
);
