CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.user AS usuario, s.song AS nome
    FROM
        SpotifyClone.song_history AS sh
            INNER JOIN
        SpotifyClone.users AS u ON sh.user_id = u.user_id
            INNER JOIN
        SpotifyClone.songs AS s ON sh.song_id = s.song_id
    ORDER BY usuario , nome;
