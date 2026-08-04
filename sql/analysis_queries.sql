SELECT
    label,
    COUNT(*) AS song_count
FROM songs
GROUP BY label
ORDER BY song_count DESC;

-- Average tempo by genre
SELECT
    label,
    ROUND(AVG(tempo), 2) AS average_tempo
FROM songs
GROUP BY label
ORDER BY average_tempo DESC;

-- Average energy by genre
SELECT
    label,
    ROUND(AVG(rmse), 3) AS average_energy
FROM songs
GROUP BY label
ORDER BY average_energy DESC;

-- Fastest genre
SELECT
    label,
    ROUND(AVG(tempo), 2) AS average_tempo
FROM songs
GROUP BY label
ORDER BY average_tempo DESC
LIMIT 1;

-- Compare energy categories
SELECT
    label,
    energy_category,
    COUNT(*) AS song_count
FROM songs
GROUP BY label, energy_category
ORDER BY label, song_count DESC;

-- Slowest 10 songs
SELECT
    file_name,
    label,
    ROUND(tempo, 2) AS tempo
FROM songs
ORDER BY tempo ASC
LIMIT 10;

-- Highest-energy genres
SELECT
    label,
    ROUND(AVG(rmse), 3) AS average_energy
FROM songs
GROUP BY label
ORDER BY average_energy DESC;

-- Percentage of high-energy songs in each genre
SELECT
    label,
    ROUND(
        100.0 * SUM(
            CASE WHEN energy_category = 'High Energy' THEN 1 ELSE 0 END
        ) / COUNT(*),
        1
    ) AS high_energy_percentage
FROM songs
GROUP BY label
ORDER BY high_energy_percentage DESC;

-- Compare brightness by genre
SELECT
    label,
    ROUND(AVG(spectral_centroid), 2) AS average_brightness
FROM songs
GROUP BY label
ORDER BY average_brightness DESC;

-- Find the brightest 10 songs
SELECT
    file_name,
    label,
    ROUND(spectral_centroid, 2) AS brightness
FROM songs
ORDER BY spectral_centroid DESC
LIMIT 10;

-- Compare tempo categories by genre
SELECT
    label,
    tempo_category,
    COUNT(*) AS song_count
FROM songs
GROUP BY label, tempo_category
ORDER BY label, song_count DESC;

