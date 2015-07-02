create or replace procedure afficherPlusVieuxAlbums
  (nombre NUMBER,
   anneeDebut album.annee%type) is
  cursor listeAlbums (anneeDebut album.annee%type) is
    select titre, annee, artiste.nom
    from album
      inner join artiste on (album.artiste_id = artiste.id)
    where annee >= anneeDebut
    order by annee;
  titreAlbum album.titre%type;
  anneeAlbum album.annee%type;
  nomArtiste artiste.nom%type;
begin
  open listeAlbums(anneeDebut);

  loop
    fetch listeAlbums into titreAlbum, anneeAlbum, nomArtiste;
    exit when listeAlbums%notfound;
    dbms_output.put_line(titreAlbum || ' ' || to_char(anneeAlbum) || ' ' || nomArtiste);
    exit when listeAlbums%rowcount = nombre;
  end loop;

  close listeAlbums;
end;
/
