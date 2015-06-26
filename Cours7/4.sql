create or replace procedure ajouterAlbum 
  (titreAlbum album.titre%type,
   anneeAlbum album.annee%type,
   maisonDisque maison_disque.nom%type,
   nomArtiste artiste.nom%type) is
  idArtiste artiste.id%type;
  idMaisonDisque maison_disque.id%type;
begin
  select id
  into idMaisonDisque
  from maison_disque
  where nom = maisonDisque;

  select id
  into idArtiste
  from artiste
  where nom = nomArtiste;

  insert into album values (album_seq.nextval, titreAlbum, anneeAlbum, idArtiste, idMaisonDisque);
  dbms_output.put_line('Enregistre');
exception
  when no_data_found then
    dbms_output.put_line('Erreur de reference');
  when others then
    dbms_output.put_line('Erreur inconnue');
end;
/
