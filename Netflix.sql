show databases;
use netflixdata;
show tables;
describe netflix_contentdata;
describe netflixuserdata;
select * from netflix_contentdata;
select count(*) from netflix_contentdata;
select * from netflixuserdata;
select count(*) from netflixuserdata;
SELECT Title FROM Netflix_Contentdata WHERE Type = 'TV Show';
SELECT count(Title) FROM Netflix_Contentdata WHERE Type = 'TV Show';
SELECT Title FROM Netflix_Contentdata WHERE Type = 'Movie';
SELECT count(Title) FROM Netflix_Contentdata WHERE Type = 'Movie';
SELECT Title, Release_year FROM Netflix_Contentdata WHERE Type = 'Movie' AND Release_year >= 2020;
SELECT DISTINCT Genre FROM Netflix_Contentdata;
SELECT count(DISTINCT Genre) FROM Netflix_Contentdata;
SELECT User_name FROM NetflixUserdata;
SELECT DISTINCT U.User_name
FROM NetflixUserdata U
INNER JOIN Netflix_Contentdata C ON U.Show_id = C.Show_id
WHERE C.Type = 'TV Show';
SELECT DISTINCT U.User_name
FROM NetflixUserdata U
INNER JOIN Netflix_Contentdata C ON U.Show_id = C.Show_id
WHERE C.Type = 'Movie';
SELECT Release_year, COUNT(*) AS Number_of_TV_Shows
FROM Netflix_Contentdata
WHERE Type = 'TV Show'
GROUP BY Release_year
ORDER BY Number_of_TV_Shows DESC
LIMIT 1;
SELECT U.User_name, C.Title
FROM NetflixUserdata U
INNER JOIN Netflix_Contentdata C ON U.Show_id = C.Show_id
WHERE C.Type = 'Movie';
SELECT U.User_name, C.Director
FROM NetflixUserdata U
INNER JOIN Netflix_Contentdata C ON U.Show_id = C.Show_id
WHERE C.Type = 'TV Show';
SELECT C.Title, COUNT(U.User_id) AS Total_Viewers
FROM Netflix_Contentdata C
JOIN NetflixUserdata U ON C.Show_id = U.Show_id
WHERE C.Type = 'TV Show'
GROUP BY C.Title
ORDER BY Total_Viewers DESC
LIMIT 5;
SELECT C.Title, COUNT(U.User_id) AS Total_Viewers
FROM Netflix_Contentdata C
JOIN NetflixUserdata U ON C.Show_id = U.Show_id
WHERE C.Type = 'Movie'
GROUP BY C.Title
ORDER BY Total_Viewers DESC
LIMIT 15;
SELECT U.User_name, COUNT(U.Show_id) AS Total_Watched
FROM NetflixUserdata U
GROUP BY U.User_name
ORDER BY Total_Watched DESC
LIMIT 1;
SELECT U.User_name, C.Title
FROM NetflixUserdata U
JOIN Netflix_Contentdata C ON U.Show_id = C.Show_id
WHERE C.Type = 'Movie' AND C.Genre = 'Comedies';
SELECT U.User_name
FROM NetflixUserdata U
JOIN Netflix_Contentdata C ON U.Show_id = C.Show_id
WHERE C.Director = 'Rajiv Menon';
SELECT C.Title, C.Director, COUNT(U.User_id) AS Viewers
FROM NetflixUserdata U
JOIN Netflix_Contentdata C ON U.Show_id = C.Show_id
WHERE C.Type = 'Movie'
GROUP BY C.Title, C.Director
HAVING COUNT(U.User_id) > 1;
SELECT C.Title, C.Director, COUNT(U.User_id) AS Viewers
FROM NetflixUserdata U
JOIN Netflix_Contentdata C ON U.Show_id = C.Show_id
WHERE C.Type = 'TV Show'
GROUP BY C.Title, C.Director
HAVING COUNT(U.User_id) > 1;
SELECT U.User_name, C.Title
FROM NetflixUserdata U
LEFT JOIN Netflix_Contentdata C ON U.Show_id = C.Show_id
WHERE C.Type = 'Movie';
SELECT U.User_name, C.Title
FROM NetflixUserdata U
RIGHT JOIN Netflix_Contentdata C ON U.Show_id = C.Show_id
WHERE C.Type = 'Movie';
SELECT U.User_name
FROM NetflixUserdata U
LEFT JOIN Netflix_Contentdata C ON U.Show_id = C.Show_id
WHERE C.Type = 'Movie' AND C.Release_year > 2020;
SELECT Genre, COUNT(*) AS GenreViews
FROM Netflix_Contentdata C
JOIN NetflixUserdata U ON C.Show_id = U.Show_id
GROUP BY Genre
ORDER BY GenreViews DESC
LIMIT 5;










