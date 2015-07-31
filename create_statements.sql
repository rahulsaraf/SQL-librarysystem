
CREATE DATABASE `librarysystem`;

CREATE TABLE `librarysystem`.`book` (
  `book_id` varchar(45) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `librarysystem`.`book_copies` (
  `book_id` varchar(45) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `no_of_copies` int(11) DEFAULT NULL,
  PRIMARY KEY (`book_id`,`branch_id`),
  KEY `branch_id_idx1` (`branch_id`),
  CONSTRAINT `book_id_idx1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `branch_id_idx1` FOREIGN KEY (`branch_id`) REFERENCES `library_branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `librarysystem`.`book_loan` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` varchar(45) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `card_no` int(11) DEFAULT NULL,
  `date_out` text,
  `due_date` text,
  `date_in` text,
  PRIMARY KEY (`loan_id`),
  KEY `book_id` (`book_id`),
  KEY `branch_id` (`branch_id`),
  KEY `card_no` (`card_no`),
  CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `branch_id` FOREIGN KEY (`branch_id`) REFERENCES `library_branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `card_no` FOREIGN KEY (`card_no`) REFERENCES `borrowers` (`card_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10035 DEFAULT CHARSET=utf8;

CREATE TABLE `librarysystem`.`books_authors` (
  `book_id` varchar(45) NOT NULL,
  `author` varchar(90) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`book_id`,`author`),
  CONSTRAINT `book_id_idx` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `librarysystem`.`borrowers` (
  `card_no` int(11) NOT NULL AUTO_INCREMENT,
  `fname` text,
  `lname` text,
  `address` text,
  `city` text,
  `state` text,
  `phone` text,
  PRIMARY KEY (`card_no`)
) ENGINE=InnoDB AUTO_INCREMENT=9051 DEFAULT CHARSET=utf8;

CREATE TABLE `librarysystem`.`fines` (
  `loan_id` int(11) NOT NULL,
  `fine_amt` decimal(4,2) DEFAULT NULL,
  `paid` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  CONSTRAINT `loan_id` FOREIGN KEY (`loan_id`) REFERENCES `book_loan` (`loan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `librarysystem`.`library_branch` (
  `branch_id` int(11) NOT NULL,
  `branch_name` text,
  `address` text,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



