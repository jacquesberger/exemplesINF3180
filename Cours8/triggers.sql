-- Empêcher la suppression sur la table artiste.
create or replace trigger artiste_empecherSuppression
before delete on artiste
for each row
begin
  raise_application_error(-20100, 'Suppression impossible sur la table artiste');
end;
/

-- Empêcher la modification d'un artiste avec album
create or replace trigger artiste_empecherModification
before update on artiste
for each row
declare
  nombre number;
begin
  select count(*)
  into nombre
  from album
  where artiste_id = :old.id;

  if nombre > 0 then
    raise_application_error(-20111, 'Impossible de modifier un artiste qui a des albums');
  end if;
end;
/

-- Ajouter un id si l'artiste n'en a pas
create or replace trigger artiste_ajout
before insert on artiste
for each row
when (new.id is null)
begin
  :new.id := artiste_seq.nextval;
end;
/

-- Stocker l'insertion dans la table historique
create or replace trigger md_ajout
after insert on maison_disque
for each row
begin
  insert into historique_md values (:new.id, 'creation', sysdate);
end;
/

-- Stocker la modification dans la table historique
create or replace trigger md_modification
after update on maison_disque
for each row
begin
  insert into historique_md values (:new.id, 'modification', sysdate);
end;
/

-- Stocker la suppression dans la table historique
create or replace trigger md_suppression
after delete on maison_disque
for each row
begin
  insert into historique_md values (:old.id, 'suppression', sysdate);
end;
/

