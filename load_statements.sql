
SET SQL_SAFE_UPDATES=0;
DELETE FROM librarysystem.fines;
DELETE FROM librarysystem.book_loan;
DELETE FROM librarysystem.books_authors;
DELETE FROM librarysystem.book_copies;
DELETE FROM librarysystem.book;
DELETE FROM librarysystem.borrowers;
DELETE FROM librarysystem.library_branch;


LOAD DATA LOCAL INFILE 'D://UTDallasStudy//Coursework//Summer - 15//Database Design//Project1//Data//books_data.csv' INTO TABLE librarysystem.book FIELDS TERMINATED BY ';' ENCLOSED BY '"' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'D://UTDallasStudy//Coursework//Summer - 15//Database Design//Project1//Data//borrowers_data.csv' INTO TABLE librarysystem.borrowers FIELDS TERMINATED BY ';' ENCLOSED BY '"' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'D://UTDallasStudy//Coursework//Summer - 15//Database Design//Project1//Data//library_branch_data.csv' INTO TABLE librarysystem.library_branch FIELDS TERMINATED BY ';' ENCLOSED BY '"' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'D://UTDallasStudy//Coursework//Summer - 15//Database Design//Project1//Data//books_copies_data.csv' INTO TABLE librarysystem.book_copies FIELDS TERMINATED BY ';' ENCLOSED BY '"' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'D://UTDallasStudy//Coursework//Summer - 15//Database Design//Project1//Data//books_authors_data.csv' INTO TABLE librarysystem.books_authors FIELDS TERMINATED BY ';' ENCLOSED BY '"' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'D://UTDallasStudy//Coursework//Summer - 15//Database Design//Project1//Data//books_loan_data.csv' INTO TABLE librarysystem.book_loan FIELDS TERMINATED BY ';' ENCLOSED BY '"' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'D://UTDallasStudy//Coursework//Summer - 15//Database Design//Project1//Data//fines_data.csv' INTO TABLE librarysystem.fines FIELDS TERMINATED BY ';' ENCLOSED BY '"' IGNORE 1 LINES;


