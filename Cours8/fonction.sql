create or replace function obtenirAnneeDernierAlbum
  (nomArtiste artiste.nom%type) return album.annee%type is
  anneeMax album.annee%type;
begin
  select max(annee)
  into anneeMax
  from album
    inner join artiste on (album.artiste_id = artiste.id)
  where artiste.nom = nomArtiste;

  return anneeMax;

exception
  when no_data_found then
    return NULL;
  when others then
    raise_application_error(-20001, 'Erreur dans la fonction');
end;
/
