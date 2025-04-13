-- https://leetcode.com/problems/movie-rating
SELECT
    *
FROM (
    -- Top rater
    SELECT TOP 1
        Users.name AS results
    FROM MovieRating
    LEFT JOIN Users ON MovieRating.user_id = Users.user_id
    GROUP BY Users.name
    ORDER BY COUNT(MovieRating.rating) DESC, Users.name ASC

    UNION ALL

    -- Top movie in February 2020
    SELECT TOP 1
        Movies.title AS results
    FROM Movies
    INNER JOIN MovieRating ON Movies.movie_id = MovieRating.movie_id
    WHERE MovieRating.created_at LIKE '2020-02-%'
    GROUP BY Movies.title
    ORDER BY AVG(MovieRating.rating * 1.0) DESC, Movies.title ASC
) AS TopRater
