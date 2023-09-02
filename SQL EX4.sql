create database movie_theaters;
use movie_theaters;

CREATE TABLE Movies (
  Code INTEGER PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Rating VARCHAR(255) 
);

CREATE TABLE MovieTheaters (
  Code INTEGER PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Movie INTEGER,  
    FOREIGN KEY (Movie) REFERENCES Movies(Code)
) ENGINE=INNODB;

INSERT INTO Movies(Code,Title,Rating) VALUES(1,'Citizen Kane','PG');
 INSERT INTO Movies(Code,Title,Rating) VALUES(2,'Singin'' in the Rain','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(3,'The Wizard of Oz','G');
 INSERT INTO Movies(Code,Title,Rating) VALUES(4,'The Quiet Man',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(5,'North by Northwest',NULL);
 INSERT INTO Movies(Code,Title,Rating) VALUES(6,'The Last Tango in Paris','NC-17');
 INSERT INTO Movies(Code,Title,Rating) VALUES(7,'Some Like it Hot','PG-13');
 INSERT INTO Movies(Code,Title,Rating) VALUES(8,'A Night at the Opera',NULL);
 
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(1,'Odeon',5);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(2,'Imperial',1);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(3,'Majestic',NULL);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(4,'Royale',6);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(5,'Paraiso',3);
 INSERT INTO MovieTheaters(Code,Name,Movie) VALUES(6,'Nickelodeon',NULL);
 
-- 4.1 Select the title of all movies.
select title from movies;

-- 4.2 Show all the distinct ratings in the database.
select distinct(rating) from movies;

-- 4.3  Show all unrated movies.
select title from movies where rating is null;

-- 4.4 Select all movie theaters that are not currently showing a movie.
select name from movietheaters where movie is null;

-- 4.5 Select all data from all movie theaters 
select * from movietheaters;
    -- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
    select * from movies mo right join movietheaters th on mo.code=th.movie;
    
-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
select mo.title,th.name from movies mo left join movietheaters th on mo.code=th.movie;

SELECT *
   FROM MovieTheaters RIGHT JOIN Movies
   ON MovieTheaters.Movie = Movies.Code;


-- 4.7 Show the titles of movies not currently being shown in any theaters.
select a.title from movies a left join movietheaters b on b.movie=a.code where b.movie is null;

-- 4.8 Add the unrated movie "One, Two, Three".	
insert into movies(Code,Title,Rating)
values(9,'one two three',null);

-- 4.9 Set the rating of all unrated movies to "G".
update movies set rating='G' where rating is NULL;

-- 4.10 Remove movie theaters projecting movies rated "NC-17".
delete from movietheaters where movie in (select code from movies where rating = 'NC - 17');

 