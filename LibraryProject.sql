CREATE DATABASE LibraryManagementSystem

USE LibraryManagementSystem

CREATE TABLE tbl_publisher (
	Name VARCHAR(50) PRIMARY KEY,
	Address VARCHAR(50),
	Phone CHAR(10),
);

CREATE TABLE tbl_book (
	BookID INT PRIMARY KEY IDENTITY(1,1),
	Title VARCHAR(50),
	PublisherName VARCHAR(50) FOREIGN KEY REFERENCES tbl_publisher(Name)
);

CREATE TABLE tbl_book_authors (
	BookID INT FOREIGN KEY REFERENCES tbl_book(BookID),
	AuthorName VARCHAR(50)
);

CREATE TABLE tbl_library_branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50),
	Address VARCHAR(50)
);

CREATE TABLE tbl_borrower (
	CardNo CHAR(8) PRIMARY KEY NOT NULL,
	Name VARCHAR(50),
	Address VARCHAR(50),
	Phone CHAR(10)
);

CREATE TABLE tbl_book_copies (
	BookID INT FOREIGN KEY REFERENCES tbl_book(BookID),
	BranchID INT FOREIGN KEY REFERENCES tbl_library_branch(BranchID),
	No_Of_Copies INT
);

CREATE TABLE tbl_book_loans (
	BookID INT FOREIGN KEY REFERENCES tbl_book(BookID),
	BranchID INT FOREIGN KEY REFERENCES tbl_library_branch(BranchID),
	CardNo CHAR(8) FOREIGN KEY REFERENCES tbl_borrower(CardNo),
	DateOut DATE,
	DueDate DATE
);

INSERT INTO tbl_publisher
	(Name,Address,Phone)
	VALUES
	('Book Publisher','2222 3rd St','5555555555'),
	('We Publish Books','4444 W Elm St','4444444444'),
	('Academy Publishing','6666 Dixie Hwy','666666666'),
	('GG Books','8888 Burnside St','9999999999'),
	('Animal House Publishing','1234 N Hampton Way','3333333333')
;


INSERT INTO tbl_book
	(Title,PublisherName)
	VALUES
	('The Lost Tribe','Book Publisher'),
	('Marys Journey','We Publish Books'),
	('Around the World','Academy Publishing'),
	('First Day of Camp','Book Publisher'),
	('Velocity','GG Books'),
	('All About Dogs','Animal House Publishing'),
	('101 Avacado Recipes','Academy Publishing'),
	('Too Late','Book Publisher'),
	('This is a Book','We Publish Books'),
	('Stuff','GG Books')
;

INSERT INTO tbl_book_authors
	(BookID,AuthorName)
	VALUES
	(2,'Stephen King'),
	(3,'John Locke'),
	(4,'Aaron Thompson'),
	(5,'Fred Flinstone'),
	(6,'Mike Tyson'),
	(7,'Eliot Smith'),
	(8,'Ben Moody'),
	(9,'Sarah Jones'),
	(10,'Steve Turner'),
	(11,'Brian Smith')
;

INSERT INTO tbl_library_branch
	(BranchName,Address)
	VALUES
	('West Hills Library','1234 W Summit Rd'),
	('Southend Library','2345 S Common Rd'),
	('Old Town Library','3456 Main St'),
	('North Field Library','4567 N Sarry Rd')
;

INSERT INTO tbl_borrower
	(CardNo,Name,Address,Phone)
	VALUES
	('D8695827','Emily Jones','456 W Helm St','8294755578'),
	('Q3939393','Fred Simpleton','345 Lane Ct','5948299488'),
	('B9876543','Ebenezer Johnson','3030 Hentward St','8290384719')
	('A1234567','Chris Smith','2345 Lynn Ave','4839393845'),
	('B2345678','Andrew Zwicker','123 Hardwood Ct','9483627003'),
	('C4567890','Bill Turner','3434 Pine St','3810392847'),
	('G2323232','Ashley McCoy','999 12th ave','4483778409'),
	('G5757575','David Wheeler','4444 3rd St','4850288837'),
	('P1827333','Jared Whyn','2222 Sandy Blvd','3811049374'),
	('A2222222','Nick Jordan','5678 N Beech St','1937483947'),
	('B1313131','Jenna Curry','3888 Broadway St','6503827354')
;

INSERT INTO tbl_book_copies
	(BookID,BranchID,No_Of_Copies)
	VALUES
	(2,1,2),
	(2,3,1),
	(3,1,3),
	(3,4,2),
	(4,2,2),
	(4,3,2),
	(4,4,3),
	(5,1,1),
	(6,2,3),
	(7,1,2),
	(7,3,1),
	(7,4,1),
	(8,4,2),
	(9,2,2),
	(9,3,1),
	(10,1,3),
	(10,2,3),
	(10,3,2),
	(10,4,1),
	(11,2,2)
;

INSERT INTO tbl_book_loans
	(BookID,BranchID,CardNo,DateOut,DueDate)
	VALUES
	(2,3,'A1234567','08/01/2017','09/01/2017'),
	(4,3,'A1234567','08/01/2017','09/01/2017'),
	(6,3,'A1234567','08/01/2017','09/01/2017'),
	(8,3,'A1234567','08/01/2017','09/01/2017'),
	(10,3,'A1234567','08/01/2017','09/01/2017'),
	(8,1,'B2345678','08/20/2017','09/20/2017'),
	(3,2,'C4567890','08/10/2017','09/10/2017'),
	(5,2,'C4567890','08/10/2017','09/10/2017'),
	(7,2,'C4567890','08/10/2017','09/10/2017'),
	(9,4,'G2323232','08/25/2017','09/25/2017'),
	(11,4,'G2323232','08/25/2017','09/25/2017'),
	(2,4,'G2323232','08/25/2017','09/25/2017'),
	(5,4,'G2323232','08/25/2017','09/25/2017'),
	(6,4,'G2323232','08/25/2017','09/25/2017'),
	(11,1,'G5757575','08/21/2017','09/21/2017'),
	(10,1,'G5757575','08/21/2017','09/21/2017'),
	(9,3,'P1827333','08/13/2017','09/13/2017'),
	(8,2,'A2222222','08/18/2017','09/18/2017'),
	(7,2,'B1313131','08/05/2017','09/05/2017'),
	(6,2,'B1313131','08/05/2017','09/05/2017'),
	(5,2,'B1313131','08/05/2017','09/05/2017')
;

SELECT * FROM tbl_book_authors;
SELECT * FROM tbl_book;
SELECT * FROM tbl_book_copies;
SELECT * FROM tbl_library_branch;
SELECT * FROM tbl_book_loans;
SELECT * FROM tbl_borrower;
SELECT * FROM tbl_publisher;



--ASSIGNMENT 1

CREATE PROC HowManyTribes
AS
BEGIN
	SELECT tbl_book_copies.No_Of_Copies, tbl_book.Title FROM tbl_book_copies 
		LEFT JOIN tbl_book ON tbl_book.BookID = tbl_book_copies.BookID
		WHERE tbl_book_copies.BranchID = 1 AND tbl_book.BookID = 2
END

--ASSIGNMENT 2

CREATE PROC TribesPerLibrary
AS
BEGIN
SELECT tbl_library_branch.BranchName, tbl_book_copies.No_Of_Copies AS 'The Lost Tribe' FROM tbl_library_branch
	LEFT JOIN tbl_book_copies ON tbl_library_branch.BranchID = tbl_book_copies.BranchID
	WHERE tbl_book_copies.BookID = 2
END

--ASSIGNMENT 3

CREATE PROC BorrowedNoBooks
AS
BEGIN
	SELECT tbl_borrower.Name FROM tbl_borrower
		LEFT JOIN tbl_book_loans ON tbl_borrower.CardNo = tbl_book_loans.CardNo
		WHERE tbl_book_loans.CardNo IS NULL
END

--ASSIGNMENT 4

CREATE PROC DueToday
AS
BEGIN
	SELECT tbl_book.Title, tbl_borrower.Name, tbl_borrower.Address FROM tbl_book_loans
		INNER JOIN tbl_book ON tbl_book_loans.BookID = tbl_book.BookID
		INNER JOIN tbl_borrower ON tbl_book_loans.CardNo = tbl_borrower.CardNo
		WHERE tbl_book_loans.BranchID = 2 AND tbl_book_loans.DueDate = GETDATE()
END

--ASSIGNMENT 5

CREATE PROC BooksLoaned
AS
BEGIN
	SELECT tbl_library_branch.BranchName, COUNT(tbl_book_loans.BranchID) AS 'Number of Loaned Books' 
		FROM tbl_library_branch
		LEFT JOIN tbl_book_loans ON tbl_library_branch.BranchID = tbl_book_loans.BranchID
		GROUP BY tbl_library_branch.BranchName
END

--ASSIGNMENT 6

CREATE PROC FiveOrMoreBooks
AS
BEGIN
	SELECT tbl_borrower.Name, tbl_borrower.Address, COUNT(tbl_book_loans.BranchID) AS 'Number of Books Loaned'
		FROM tbl_borrower
		JOIN tbl_book_loans ON tbl_borrower.CardNo = tbl_book_loans.CardNo
		GROUP BY tbl_borrower.Name, tbl_borrower.Address
		HAVING COUNT(tbl_book_loans.BranchID) >= 5
END

--ASSIGNMENT 7

CREATE PROC SKBookNumber
AS
BEGIN
	SELECT tbl_book_authors.AuthorName, tbl_book.Title, tbl_book_copies.No_Of_Copies
		FROM tbl_book
		JOIN tbl_book_authors ON tbl_book.BookID = tbl_book_authors.BookID
		JOIN tbl_book_copies ON tbl_book.BookID = tbl_book_copies.BookID
		WHERE tbl_book_authors.AuthorName = 'Stephen King'
		AND tbl_book_copies.BranchID = 1
END

--PROCEDURES:

EXEC HowManyTribes
EXEC TribesPerLibrary
EXEC BorrowedNoBooks
EXEC DueToday
EXEC BooksLoaned
EXEC FiveOrMoreBooks
EXEC SKBookNumber

