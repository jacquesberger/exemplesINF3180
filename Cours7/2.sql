create or replace procedure afficherNombreAlbums is
  nombreAlbums NUMBER;
  maxAnnee Album.annee%type;
begin
  select count(*)
  into nombreAlbums
  from album;

  select max(annee)
  into maxAnnee
  from album;

  dbms_output.put_line('Nombre albums : ' || to_char(nombreAlbums));
  dbms_output.put_line('Max annee : ' || to_char(maxAnnee));
end;
/
