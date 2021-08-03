CREATE VIEW perfil_artistas AS
    SELECT 
        art.artist AS artista,
        alb.album AS album,
        COUNT(fa.artist_id) AS seguidores
    FROM
        SpotifyClone.albums AS alb
            INNER JOIN
        SpotifyClone.artists AS art ON alb.artist_id = art.artist_id
            INNER JOIN
        SpotifyClone.followed_artists AS fa ON fa.artist_id = art.artist_id
    GROUP BY album , artista
    ORDER BY seguidores DESC , artista , album;
