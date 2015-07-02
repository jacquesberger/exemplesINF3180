-- Empêcher la suppression sur la table artiste.
create or replace trigger artiste_empecherSuppression
before delete on artiste
for each statement
begin
  raise_application_error(-20100, 'Suppression impossible sur la table artiste');
end;
/
