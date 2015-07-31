
DROP TABLE `librarysystem`.`books_authors_bk`;
CREATE TABLE `librarysystem`.`books_authors_bk` (
  `book_id` text,
  `author` text,
  `title` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM librarysystem.books_authors_bk;
LOAD DATA LOCAL INFILE 'D://UTDallasStudy//Coursework//Summer - 15//Database Design//Project1//Data//books_authors.csv' INTO TABLE librarysystem.books_authors_bk FIELDS TERMINATED BY '	' ENCLOSED BY '"' IGNORE 1 LINES;

ALTER TABLE `librarysystem`.`books_authors_bk` 
DROP COLUMN `title`;


DELIMITER $$
 DROP PROCEDURE IF EXISTS librarysystem.cursor_proc $$
 CREATE PROCEDURE librarysystem.cursor_proc()
 BEGIN
   DECLARE book_idd   VARCHAR(255);
   DECLARE auth_name VARCHAR(255);
   DECLARE VAR VARCHAR(255);
   DECLARE TEMP VARCHAR(255);
   -- this flag will be set to true when cursor reaches end of table
   DECLARE exit_loop BOOLEAN;         
   -- Declare the cursor
   DECLARE employee_cursor CURSOR FOR
     SELECT BOOK_ID, (AUTHOR) FROM librarysystem.books_authors_bk WHERE BOOK_ID = '062593460X' AND AUTHOR LIKE '%,%';
   -- set exit_loop flag to true if there are no more rows
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
   -- open the cursor
   OPEN employee_cursor;
   -- start looping
   employee_loop: LOOP
     -- read the name from next row into the variables 
     FETCH  employee_cursor INTO book_idd, auth_name;
     -- check if the exit_loop flag has been set by mysql, 
     -- close the cursor and exit the loop if it has.
     SET TEMP = auth_name;
     WHILE LOCATE(',', auth_name) != 0 DO
		SET VAR = TRIM(SUBSTRING(auth_name,1,LOCATE(',', auth_name) - 1));
		INSERT INTO librarysystem.books_authors_bk (BOOK_ID, AUTHOR) VALUES (book_idd, VAR);
        SET auth_name = SUBSTRING(auth_name,LOCATE(',', auth_name) + 1, LENGTH(auth_name));
     END WHILE;
     INSERT INTO librarysystem.books_authors_bk (BOOK_ID, AUTHOR) VALUES (book_idd, TRIM(auth_name));
     SET SQL_SAFE_UPDATES=0;
     DELETE FROM librarysystem.books_authors_bk WHERE BOOK_ID = book_idd AND AUTHOR = TEMP;
     IF exit_loop THEN
         CLOSE employee_cursor;
         LEAVE employee_loop;
     END IF;
   END LOOP employee_loop;
 END $$
 DELIMITER ;

CALL librarysystem.cursor_proc();

SELECT *
FROM librarysystem.books_authors_bk
INTO OUTFILE 'D://UTDallasStudy//Coursework//Summer - 15//Database Design//Project1//Data//books_authors_refined.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ';' ESCAPED BY '"'
LINES TERMINATED BY '\r\n';



