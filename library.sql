CREATE DATABASE library;
USE library;

CREATE TABLE Publishers( 
    publisher_id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(50) NOT NULL, 
    address VARCHAR(255), 
    contact_info VARCHAR(255) 
);
CREATE TABLE Authors( 
    author_id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(50) NOT NULL, 
    birth_date DATE, 
    biography VARCHAR(255) 
);
CREATE TABLE Categories( 
    category_id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(50) 
);
CREATE TABLE Books( 
    book_id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(100) NOT NULL, 
    ISBN VARCHAR(13) NOT NULL, 
    publication_date DATE NOT NULL, 
    publisher_id INT, 
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id) 
);
CREATE TABLE Book_Categories( 
    book_id INT, 
    category_id INT, 
    FOREIGN KEY (book_id) REFERENCES Books(book_id), 
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) 
);
CREATE TABLE Book_Authors( 
    book_id INT, 
    author_id INT, 
    FOREIGN KEY (book_id) REFERENCES Books(book_id), 
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) 
);
CREATE TABLE Book_Copies( 
    copy_id INT PRIMARY KEY AUTO_INCREMENT, 
    book_id INT, 
    "location" VARCHAR(255), 
    FOREIGN KEY (book_id) REFERENCES Books(book_id) 
);
CREATE TABLE Library_Patrons ( 
  patron_id INT PRIMARY KEY AUTO_INCREMENT, 
  patron_name VARCHAR(50) NOT NULL, 
  Address VARCHAR(250) NOT NULL, 
  phone_Number VARCHAR(15) NOT NULL, 
  email VARCHAR(100) NOT NULL 
);
CREATE TABLE Checkouts( 
    checkout_id INT PRIMARY KEY AUTO_INCREMENT, 
    checkout_date DATE NOT NULL, 
    book_id INT, 
    patron_id INT, 
    FOREIGN KEY (book_id) REFERENCES Books(book_id), 
    FOREIGN KEY (patron_id) REFERENCES Library_Patrons(patron_id) 
)
