DELIMITER $$ 
CREATE PROCEDURE albuns_do_artista(IN artist VARCHAR(30)) 
BEGIN
SELECT
  art.nome artist, alb.titulo album
FROM
  SpotifyClone.artists art
  INNER JOIN SpotifyClone.albums alb ON art.artist_id = alb.artist_id
WHERE
  art.nome = artist
ORDER BY album;
END $$
DELIMITER ;
