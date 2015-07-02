-- Empêcher la suppression sur la table artiste.
create or replace trigger artiste_empecherSuppression
before delete on artiste
for each row
begin
  raise_application_error(-20100, 'Suppression impossible sur la table artiste');
end;
/

create or replace trigger artiste_empecherModification
before update on artiste
referencing
  old row as avant
for each row
when
  (select count(*)
   from album
   where artiste_id = old.id) > 0
begin
  raise_application_error(-20111, 'Impossible de modifier un artiste qui a des albums');
end;
/
