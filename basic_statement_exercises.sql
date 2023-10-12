-- Use the albums_db database.
USE albums_db;

-- What is the primary key for the albums table?
-- A: id column is the PK.

-- What does the column named 'name' represent?
-- A: Name of the album, in a varchar(240) data type

-- What do you think the sales column represents?
-- A: The number of albums sold.

-- Find the name of all albums by Pink Floyd.
SELECT name
FROM albums
WHERE artist = 'Pink Floyd';
-- A: The dark side of the moon & The Wall

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was released?
SELECT release_date
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
-- A: 1967

-- What is the genre for the album Nevermind?
SELECT genre
FROM albums
WHERE name = 'Nevermind';
-- A: Grunge, Alternative rock

-- Which albums were released in the 1990s?
SELECT name
FROM albums
WHERE release_date >= 1990 AND release_date <= 1999;
-- A: 'Titanic: Music from the Motion Picture'
-- 'The Immaculate Collection'
-- 'The Bodyguard'
-- 'Supernatural'
-- 'Nevermind'
-- 'Metallica'
-- 'Let\'s Talk About Love'
-- 'Jagged Little Pill'
-- 'Falling into You'
-- 'Dangerous'
-- 'Come On Over'


-- Which albums had less than 20 million certified sales? Rename this column as low_selling_albums.
SELECT name as low_selling_albums
FROM albums
WHERE sales < 20000000;
-- A: 'Titanic: Music from the Motion Picture'
-- 'Thriller'
-- 'Their Greatest Hits (1971–1975)'
-- 'The Wall'
-- 'The Immaculate Collection'
-- 'The Dark Side of the Moon'
-- 'The Bodyguard'
-- 'Supernatural'
-- 'Sgt. Pepper\'s Lonely Hearts Club Band'
-- 'Saturday Night Fever'
-- 'Rumours'
-- 'Nevermind'
-- 'Metallica'
-- 'Let\'s Talk About Love'
-- 'Led Zeppelin IV'
-- 'Jagged Little Pill'
-- 'Hotel California'
-- 'Grease: The Original Soundtrack from the Motion Picture'
-- 'Falling into You'
-- 'Dirty Dancing'
-- 'Dangerous'
-- 'Come On Over'
-- 'Brothers in Arms'
-- 'Born in the U.S.A.'
-- 'Bat Out of Hell'
-- 'Bad'
-- 'Back in Black'
-- 'Appetite for Destruction'
-- 'Abbey Road'
-- '21'
-- '1'
