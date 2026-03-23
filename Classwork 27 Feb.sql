DROP DATABASE IF EXISTS cinema;
CREATE DATABASE cinema;
USE cinema;

CREATE TABLE Movie (
    MID INT PRIMARY KEY,
    Title VARCHAR(255),
    ReleaseYear INT,
    Director VARCHAR(255)
);

CREATE TABLE Users (
    USER_ID INT PRIMARY KEY,
    NAME VARCHAR(255),
    PHONE_NUMBER VARCHAR(15),
    EMAIL VARCHAR(150)
);

CREATE TABLE Rating (
    USER_ID INT,
    MID INT,
    RATING INT,
    RATING_DATE DATE,
    FEEDBACK VARCHAR(255),

    PRIMARY KEY (USER_ID, MID),

    FOREIGN KEY (USER_ID) REFERENCES Users(USER_ID),
    FOREIGN KEY (MID) REFERENCES Movie(MID)
);

INSERT INTO Movie (MID, Title, ReleaseYear, Director) VALUES
(1, 'Inception', 2010, 'Christopher Nolan'),
(2, 'Titanic', 1997, 'James Cameron'),
(3, 'Avatar', 2009, 'James Cameron'),
(4, 'Interstellar', 2014, 'Christopher Nolan');

INSERT INTO Movie (MID, Title, ReleaseYear, Director) VALUES
(5, 'Purna Bahadur ko Sarangi', 2025, 'Arpit Shrestha');

INSERT INTO Users (USER_ID, NAME, PHONE_NUMBER, EMAIL) VALUES
(101, 'Arpit', '9812345678', 'arpit@email.com'),
(102, 'Rahul', '9823456789', 'rahul@email.com'),
(103, 'Sneha', '9801234567', 'sneha@email.com');

INSERT INTO Rating (USER_ID, MID, RATING, RATING_DATE, FEEDBACK) VALUES
(101, 1, 5, '2026-02-27', 'Amazing movie!'),
(101, 4, 4, '2026-02-27', 'Very emotional'),
(102, 2, 5, '2026-02-26', 'Classic love story'),
(103, 3, 4, '2026-02-25', 'Great visuals');
INSERT INTO Rating (USER_ID, MID, RATING, RATING_DATE, FEEDBACK) VALUES
(102, 5, 5, '2025-05-06', 'Babal');

#Q1. Find the Title and year of movie that were created after Release Year 2000.
SELECT Title, ReleaseYear
FROM Movie
WHERE ReleaseYear > 2000;

#Q2. Find the title, MID and Rating of movies that were created before the year 2000 and rating > 2
SELECT Movie.Title, Movie.MID, Rating.RATING
FROM Movie
JOIN Rating ON Movie.MID = Rating.MID
WHERE Movie.ReleaseYear < 2000
AND Rating.RATING > 2;

#Q3. Sort all the movies by decending rating
SELECT Movie.Title,Rating.RATING
FROM Movie
JOIN Rating ON Movie.MID = Rating.MID
ORDER BY Rating.RATING Desc;

#Q4. Find all Movies that have the exact same Ratings.
SELECT RATING, COUNT(*) AS total
FROM Rating
GROUP BY RATING
HAVING COUNT(*) > 1;

#Q5 Create a query that looks for a Movie's Id, title and director but only if it has rating above 4
SELECT DISTINCT Movie.MID, Movie.Title, Movie.Director
FROM Movie
JOIN Rating ON Movie.MID = Rating.MID
WHERE Rating.RATING > 4;