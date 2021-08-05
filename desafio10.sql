DELIMITER $$ 
CREATE FUNCTION quantidade_musicas_no_historico(user_id INT) 
RETURNS INT READS SQL DATA 
BEGIN 
DECLARE user_song_history INT;
SELECT
  COUNT(*)
FROM
  SpotifyClone.song_history
WHERE
  SpotifyClone.song_history.user_id = user_id INTO user_song_history;
RETURN user_song_history;
END $$ 
DELIMITER ;
