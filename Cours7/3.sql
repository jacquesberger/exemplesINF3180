create or replace procedure afficherSiAucunAlbum is
  nombreAlbums NUMBER;
begin
  select count(*)
  into nombreAlbums
  from album;

  if nombreAlbums = 0 then
    dbms_output.put_line('Aucun album dans la table.');
  end if;
  
  if nombreAlbums = 16 then
    dbms_output.put_line('Chargement initial.');
  else
    dbms_output.put_line('Alteration de la table.');
  end if;
end;
/
