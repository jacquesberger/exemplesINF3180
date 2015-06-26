drop procedure afficherParametre;

create procedure afficherParametre
  (param NUMBER) is
  dbms_output.put_line('Voici le parametre : ' || to_char(param));
end afficherParametre;
/


