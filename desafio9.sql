DELIMITER $$ 
CREATE PROCEDURE albuns_do_artista(IN artist VARCHAR(30)) 
BEGIN
SELECT
  art.artist AS artist, alb.album AS album
FROM
  SpotifyClone.artists art
  INNER JOIN SpotifyClone.albums alb ON art.artist_id = alb.artist_id
WHERE
  art.artist = artist
ORDER BY album;
END $$
DELIMITER ;
