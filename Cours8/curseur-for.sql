create or replace procedure afficherAlbumsPourArtiste
  (nomArtiste artiste.nom%type) is
  cursor listeAlbums (idArtiste artiste.id%type) is
    select titre, annee
    from album
    where artiste_id = idArtiste
    order by annee;
  idArtiste artiste.id%type;
begin
  select id
  into idArtiste
  from artiste
  where nom = nomArtiste;

  for ligne in listeAlbums(idArtiste) loop
    dbms_output.put_line(ligne.titre || ' ' || to_char(ligne.annee));
  end loop;
exception
  when no_data_found then
    dbms_output.put_line('Artiste non connu');
  when others then
    raise_application_error(-20011, 'Erreur inconnue dans la procedure');
end;
/
