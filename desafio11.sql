SELECT 
    s.song AS nome, COUNT(sh.song_id) AS reproducoes
FROM
    SpotifyClone.songs AS s
        INNER JOIN
    SpotifyClone.song_history AS sh ON s.song_id = sh.song_id
        INNER JOIN
    SpotifyClone.users AS u ON u.user_id = sh.user_id
WHERE
    u.plan_id IN (2 , 3)
GROUP BY nome
ORDER BY nome;
