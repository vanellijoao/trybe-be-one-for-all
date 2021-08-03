CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        s.song AS cancao, COUNT(*) AS reproducoes
    FROM
        SpotifyClone.song_history AS sh
            INNER JOIN
        SpotifyClone.songs AS s ON sh.song_id = s.song_id
    GROUP BY cancao
    ORDER BY reproducoes DESC , cancao
    LIMIT 2;
