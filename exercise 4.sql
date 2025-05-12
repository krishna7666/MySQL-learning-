show databases; 
create database exercise4 ; 
use exercise4;
select * from directors;
CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255),
    release_year INT,
    genre VARCHAR(50),
    director_id INT,
    foreign key (director_id) references directors(director_id)
);

INSERT INTO movies VALUES
(1, 'Space Odyssey', 2020, 'Sci-Fi', 1),
(2, 'The Great Escape', 2019, 'Action', 2),
(3, 'Romantic Fable', 2021, 'Romance', 3),
(4, 'Mystery of Time', 2022, 'Mystery', NULL),
(5, 'Comedy Nights', 2020, 'Comedy', 2),
(6, 'Historical Journey', 2018, 'History', NULL),
(7, 'Future Wars', 2022, 'Sci-Fi', 1),
(8, 'Nature Documented', 2021, 'Documentary', 4),
(9,'Top Gun',2018,'Drama & Action',1);

CREATE TABLE directors (
    director_id INT PRIMARY KEY,
    name VARCHAR(255),
    birth_year INT,
    release_year INT,
    nationality VARCHAR(50)
);

INSERT INTO directors VALUES
(1, 'John Smith',1975, 2020, 'American'),
(2, NULL,1982, 2019, 'British'),
(3, 'Michael Brown',1968, 2021, 'Canadian'),
(4, 'Sophia Davis',1978, 2021, 'Australian'),
(5, 'Daniel Lee',1980, 2018, 'Korean');


-- Q. List all movies along with their director names.
select movies.title , directors.name 
from  movies inner join directors 
on movies.director_id= directors.director_id ;

-- Q. Find the titles of movies that do not have an associated director in the directors table.
select movies.title,  directors.name ,  directors.director_id
from movies left join directors 
on movies.director_id= directors.director_id
where directors.director_id is null ;

-- Q. Display the names of directors who have directed more than one movie.
select directors.name  
from movies join directors 
on movies.director_id= directors.director_id
group by directors.director_id 
having count(movies.movie_id)>1;

-- Q. List all movies released after 2019 along with their directors’ nationalities.
select movies.title , directors.release_year ,directors.name, directors.nationality 
from movies	 join directors
on movies.director_id= directors.director_id
where directors.release_year> 2019;

-- Q. Find the titles of movies along with their directors’ names, for movies that belong to the ‘Sci-Fi’ genre.
select movies.title , directors.name , movies.genre
from movies join directors 
on movies.director_id= directors.director_id
where genre='Sci-Fi' ;

-- Q. List all directors who have made a ‘Comedy’ movie.
select directors.name , movies.genre 
from movies join directors
on movies.director_id= directors.director_id
where genre ='comedy';

-- Q. Show the title and release year of movies directed by ‘Emily Johnson’.

INSERT INTO directors VALUES
(6, 'Emily Johnson', 1985, 2023, 'American');

select movies.title ,movies.release_year , directors.name
from movies join directors
on movies.director_id= directors.director_id
where directors.name ='Emily Johnson';
 
-- Q. Identify movies released before 2021 that do not have a director listed.

select movies.title ,  movies.release_year 
from movies join directors
on movies.director_id= directors.director_id
where directors.release_year < 2021 AND movies.director_id IS NULL;

-- Q. Display the count of movies each director has made, including directors who have not made any movies.
select directors.name , count(movies.movie_id) as movie_count
from movies join directors
on movies.director_id= directors.director_id
group by directors.name;

-- Q. List the movies and their genres directed by directors born after 1970.
select movies.title , movies.genre , directors.birth_year
from movies join directors
on movies.director_id= directors.director_id
where birth_year > 1970 ;

-- Q. Show the titles of movies along with the birth years of their directors.
select movies.title ,directors.name, directors.birth_year
from movies join directors
on movies.director_id= directors.director_id;

-- Q. List the names of all directors and the number of ‘Action’ movies they have directed.
select directors.name , movies.genre
from movies join directors
on movies.director_id= directors.director_id
where genre= 'action';

-- Q. Find the titles of movies directed by directors of ‘American’ nationality.
select movies.title , directors.nationality 
from movies join directors
on movies.director_id= directors.director_id
where directors.nationality= 'american';

-- Q. Display the nationalities of directors who have directed movies released in 2020 or later.
select distinct directors.nationality 
from movies join directors
on movies.director_id= directors.director_id
where directors.release_year >=2020 ;

-- Q. List all movies, including the director’s name, for those movies where the director’s last name is ‘Johnson’.
select movies.title ,directors.name 
from movies right join directors
on movies.director_id= directors.director_id 
where name like '%Johnson';

-- Q. List all movies by the same directors in descending order of release year.
select movies.title , movies.release_year 
from movies join directors
on movies.director_id= directors.director_id
order by directors.release_year desc;

-- Q. Find directors who have directed in more than one genre.
select directors.name , count(distinct movies.genre)as genre_count
from movies join directors
on movies.director_id= directors.director_id
group by directors.name
having  count(distinct movies.genre)>1 ;

-- Q. Calculate the total number of movies each director has made, sorted by the most prolific.
select  movies.title , count(movies.movie_id) as movie_count
from movies join directors
on movies.director_id= directors.director_id
group by directors.name
order by movie_count desc;

-- Q. Show all directors who have made both ‘Sci-Fi’ and ‘Action’ movies without listing the same director twice. -----------------------------------------------------------------------------
select directors.name , movies.genre
from movies join directors
on movies.director_id= directors.director_id
where genre ='sci-fi' or genre= 'action';

-- Q. Identify the director who has worked with the most genres.
select directors.name , count(distinct movies.genre) as count_genre 
from movies join directors
on movies.director_id= directors.director_id
group by directors.name
having directors.name is not null
order by count_genre desc limit 1;

-- Q. Calculate the span of years each director has been active (from their first to their last movie).
select directors.name,
    MIN(movies.release_year) AS first_movie_year,
    MAX(movies.release_year) AS last_movie_year,
    (MAX(movies.release_year) - MIN(movies.release_year)) AS active_span 
from movies join directors
on movies.director_id= directors.director_id
group by directors.name ;

-- Q. List directors whose movies have never been in the ‘Documentary’ genre.
select directors.name, movies.genre
from movies join directors
on movies.director_id= directors.director_id
where movies.genre not like 'documentary'
group by directors.name 
having directors.name is not null;

-- Q. Find the year with the most diverse genres of movies released.

select * from movies;							
select * from directors;

-- Q. Show all movies released in the same year as ‘Space Odyssey’ but in a different genre.
select movies.title ,movies.genre 
from movies join directors
on movies.director_id= directors.director_id
where genre  like 'space odyssey';





-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE Books (
    book_id INT,
    title VARCHAR(255),
    author VARCHAR(255),
    publication_year INT
);

INSERT INTO Books (book_id, title, author, publication_year) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925),
(2, 'To Kill a Mockingbird', 'Harper Lee', 1960),
(3, '1984', 'George Orwell', 1949);

CREATE TABLE Magazines (
    magazine_id INT,
    title VARCHAR(255),
    editor VARCHAR(255),
    publication_year INT
);

INSERT INTO Magazines (magazine_id, title, editor, publication_year) VALUES
(1, 'National Geographic', 'Susan Goldberg', 1888),
(2, 'The New Yorker', 'David Remnick', 1925),
(3, 'TIME', 'Edward Felsenthal', 1923);

select * from magazines;
