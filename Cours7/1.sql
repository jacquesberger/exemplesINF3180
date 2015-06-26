show errors

create or replace procedure afficherParametre
  (param NUMBER) is
  -- Declarations
begin
  dbms_output.put_line('Voici le parametre : ' || to_char(param));
end afficherParametre;
/


