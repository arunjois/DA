hive
hive> show tables;
hive> create database movies;
hive> use movies;
hive> create table lab5(movie_id INT, title STRING, genres INT, user_id INT, recommended STRING, ratings DOUBLE, activity INT) row format delimited fields terminated by ',' stored as textfile;
hive> describe lab5;
hive> LOAD DATA INPATH '/Pig.csv' OVERWRITE INTO TABLE lab5;
Loading data to table movies.lab5
hive> select * from lab5;
hive> select user_id, movie_id, CASE WHEN genres > 0 THEN genres ELSE -1 END genres, CASE recommended WHEN 'Y' THEN 1 ELSE 0 END recommended, activity FROM lab5 WHERE activity IN(2,5,8) LIMIT 20;
hive> SELECT user_id, movie_id, title FROM lab5 WHERE activity ==2;            
hive> create table lab5_stage1(movie_id INT, genres INT, user_id INT, recommended STRING,activity INT) row format delimited fields terminated by '\t';    
hive> INSERT OVERWRITE TABLE lab5_stage1 SELECT * FROM (select user_id, movie_id, CASE WHEN genres > 0 THEN  genres ELSE -1 END genres, CASE recommended WHEN  'Y' THEN 1 ELSE 0 END recommended, activity FROM lab5 WHERE activity IN(2,5,8))union_result;
hive> select * from lab5_stage1; 
