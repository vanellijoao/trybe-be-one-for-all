DELIMITER $$ 
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON SpotifyClone.users
FOR EACH ROW BEGIN
DELETE FROM
  SpotifyClone.song_history
WHERE
  OLD.user_id = SpotifyClone.song_history.user_id;
DELETE FROM
  SpotifyClone.followed_artists
WHERE
  OLD.user_id = SpotifyClone.followed_artists.user_id;
END $$ 
DELIMITER ;
