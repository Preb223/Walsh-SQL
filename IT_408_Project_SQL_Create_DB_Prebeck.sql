--/////////////////////////////////////////////////////////
--Create MovieRetail Database
--Blake Prebeck
--IT 408 - Final Project - Create Database
--/////////////////////////////////////////////////////////

USE MASTER;
GO
DROP DATABASE MovieRetail;
GO
CREATE DATABASE MovieRetail;
GO
USE MovieRetail;
GO


--///////////////////
--Create Tables
--///////////////////

--Create Genre Table
CREATE TABLE Genre (
	GenreID				INT				NOT NULL	IDENTITY(3001,1),
	GEN_Type			CHAR(10)		NOT NULL,
	GEN_Description		VARCHAR(225)	NOT NULL,
		--Primary Key Constraint 
	CONSTRAINT Genre_GenreID_pk PRIMARY KEY(GenreID),
);
GO


--Create Movie Table
CREATE TABLE Movie (
	MovieID				INT				NOT NULL	IDENTITY(1001,1),
	MOV_Title			VARCHAR(80)		NOT NULL,
	MOV_Year			INT				NOT NULL,
	GenreID				INT				NOT NULL,
	MOV_Director		CHAR(30)		NOT NULL,
	MOV_LeadActor		CHAR(30)		NOT NULL,
	MOV_Cost			DECIMAL(9,2)	NOT NULL,
		--Primary Key Constraint 
	CONSTRAINT Movie_MovieID_pk PRIMARY KEY(MovieID),
		--Foreign Key Constraint
	CONSTRAINT Movie_GenreID_fk FOREIGN KEY(GenreID) REFERENCES Genre(GenreID)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
);
GO


--Create Customer Table
CREATE TABLE Customer (
	CustomerID			INT				NOT NULL	IDENTITY(7001,1),
	CUS_FirstName		VARCHAR(30)		NOT NULL,
	CUS_LastName		VARCHAR(30)		NOT NULL,
	CUS_Address			VARCHAR(50)		NOT NULL,
	CUS_City			VARCHAR(50)		NOT NULL,
	CUS_State			CHAR(2)			NOT NULL,
	CUS_Zip				CHAR(5)			NOT NULL,
	CUS_Phone			CHAR(10)		NOT NULL,
	CUS_Email			VARCHAR(50)		NOT NULL,
		--Primary Key Constraint 
	CONSTRAINT Customer_CustomerID_pk PRIMARY KEY(CustomerID),
);
GO


--Create Purchase Table
CREATE TABLE Purchase (
	PurchaseID			INT				NOT NULL	IDENTITY(5001,1),
	CustomerID			INT				NOT NULL,
	PUR_Date			DATE			NOT NULL,
	PUR_Time			TIME			NOT NULL,
		--Primary Key Constraint
	CONSTRAINT Purchase_PurchaseID_pk PRIMARY KEY(PurchaseID),
		--Foreign Key Constraint
	CONSTRAINT Purchase_CustomerID_fk FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
);
GO


--Create Movie_Purchase Table
CREATE TABLE Movie_Purchase (
	MovieID				INT				NOT NULL,
	PurchaseID			INT				NOT NULL,
	MOP_Price			DECIMAL(9,2)	NOT NULL,
	MOP_Quantity		INT				NOT NULL,
	--Primary Key Constraint
	CONSTRAINT Movie_Purchase_MoviePurchaseID_pk PRIMARY KEY(MovieID, PurchaseID),
	--Foreign Key Constraints
	CONSTRAINT Movie_Purchase_MovieID_fk FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
	CONSTRAINT Movie_Purchase_PurchaseID_fk FOREIGN KEY (PurchaseID) REFERENCES Purchase(PurchaseID)
		ON UPDATE CASCADE
		ON DELETE NO ACTION,
);
GO


--///////////////////
--Insert Data
--///////////////////

--Insert Data Into Genre Table
INSERT INTO Genre
	(GEN_Type, GEN_Description)
VALUES
	('Action', 'The protagonist is thrust into a series of events that typically involve violence and physical feats.'),
	('Comedy', '	Designed to make the audience laugh through amusement and emphasize humor.'),
	('Drama', 'Intended to be more serious than humorous in tone.'),
	('Fantasy', 'Themes usually involving magic, supernatural events, mythology, folklore, or exotic fantasy worlds.'),
	('Horror', 'Seeks to elicit fear or disgust in its audience for entertainment purposes.'),
	('Mystery', 'Revolves around the solution of a problem or a crime.'),
	('Romance', 'Romance films make the romantic love story or the search for strong and pure love and romance the main plot focus.'),
	('Thriller', 'Evokes excitement and suspense in the audience.'),
	('Western', 'Set primarily in the latter half of the 19th century and the early 20th century in the Western United States, which is styled the "Old West" or the "Wild West".'),
	('Sci-Fi', 'Uses speculative, fictional science-based depictions of phenomena that are not fully accepted by mainstream science, such as extraterrestrial lifeforms, spacecraft, robots, cyborgs, interstellar travel or other technologies.');
GO


--Insert Data Into Movie Table
INSERT INTO Movie
	(MOV_Title, MOV_Year, GenreID, MOV_Director, MOV_LeadActor, MOV_Cost)
VALUES
	('The Godfather', '1972', '3003', 'Francis Ford Coppola', 'Marlon Brando', 20.00),
	('The Shawshank Redemption', '1994', '3003', 'Frank Darabon', 'Tim Robbins', 20.00),
	('Schindler"s List', '1993', '3003', 'Steven Spielberg', 'Liam Neeson', 20.00),
	('Raging Bull', '1980', '3003', 'Martin Scorsese', 'Robert De Niro', 20.00),
	('Casablanca', '1942', '3007', 'Michael Curtiz', 'Humphrey Bogart', 20.00),
	('Citizen Kane', '1941', '3006', 'Orson Welles', 'Orson Welles', 20.00),
	('Gone with the Wind', '1939', '3007', 'Victor Flemming', 'Clark Gable', 20.00), 
	('The Wizard of Oz', '1939', '3004', 'Victor Flemming', 'Judy Garland', 20.00),
	('One Flew Over the Cuckoo"s Nest', '1975', '3003', 'Milos Forman', 'Jack Nicholson', 20.00),
	('Lawrence of Arabia', '1962', '3003', 'David Lean', 'Peter O"Toole', 20.00),
	('Vertigo', '1958', '3008', 'Alfred Hitchcock', 'James Stewart', '20.00'),
	('Psycho', '1960', '3008', 'Alfred Hitchcock', 'Anthony Perkins', 20.00),
	('The Godfather: Part II', '1974', '3003', 'Francis Ford Coppola', 'Al Pacino', 20.00), 
	('On The Waterfront', '1954', '3008', 'Elia Kazan', 'Marlon Brando', 20.00),
	('Sunset Blvd.', '1950', '3003', 'Billy Wilder', 'William Holden', 20.00), 
	('Forest Gump', '1994', '3003', 'Robert Zemeckis', 'Tom Hanks', 20.00), 
	('The Sound of Music', '1965', '3003', 'Robert Wise', 'Julie Andrews', 20.00), 
	('12 Angry Men', '1957', '3003', 'Sidney Lumet', 'Henry Fonda', 20.00), 
	('West Side Story', '1961', '3003', 'Jerome Robbins', 'Natalie Wood', 20.00), 
	('Star Wars: Episode IV - A New Hope', '1977', '3004', 'George Lucas', 'Mark Hamill', 20.00), 
	('2001: A Space Odyssey', '1968', '3010', 'Stanley Kubrick', 'Keir Dullea', 20.00), 
	('E.T. the Extra-Terrestrial', '1982', '3010', 'Steven Spielberg', 'Henry Thomas', 20.00), 
	('The Silence of the Lambs', '1991', '3005', 'Jonathan Demme', 'Jodie Foster', 20.00), 
	('Chinatown', '1974', '3006', 'Roman Polanski', 'Jack Nicholson', 20.00), 
	('The Bridge on the River Kwai', '1957', '3003', 'David Lean', 'William Holden', 20.00), 
	('Singin" in the Rain', '1952', '3002', 'Stanley Donen', 'Gene Kelly', 20.00), 
	('It"s a Wonderful Life', '1946', '3002', 'Frank Capra', 'James Stewart', 20.00), 
	('Dr. Strengelove or: How I learned to Stop Worrying and Love the Bomb', '1964', '3002', 'Stanley Kubrick', 'Peter Sellers', 20.00), 
	('Some Like It Hot', '1959', '3002', 'Billy Wilder', 'Marilyn Monroe', 20.00), 
	('Ben-Hur', '1959', '3003', 'William Wyler', 'Charlton Heston', 20.00), 
	('Apocalypse Now', '1979', '3003', 'Francis Ford Coppola', 'Martin Sheen',	20.00), 
	('Amadeus', '1984', '3003', 'Milos Forman', 'F. Murray Abraham', 20.00), 
	('The Lord of the Rings: The Return of the King', '2003', '3001', 'Peter Jackson', 'Elijah Wood', 20.00), 
	('Gladiator', '2000', '3001', 'Ridley Scott', 'Russel Crowe', 20.00), 
	('Titanic', '1997', '3007', 'James Cameron', 'Leonadro DiCaprio', 20.00), 
	('From Here to Eternity', '1953', '3003', 'Fred Zinnemann', 'Burt Lancaster', 20.00),
	('Saving Private Ryan', '1998', '3003', 'Steven Spielberg', 'Tom Hanks', 20.00), 
	('Unforgiven', '1992', '3009', 'Clint Eastwood', 'Clint Eastwood', 20.00), 
	('Indiana Jones and the Raiders of the Lost Ark', '1981', '3001', 'Steven Spielberg', 'Harrison Ford', 20.00), 
	('Rocky', '1976', '3003', 'John G. Avildsen', 'Sylvester Stallone', 20.00), 
	('A Streetcar Named Desire', '1951', '3003', 'Elia Kazan', 'Vivien Leigh', 20.00), 
	('The Philadelphia Story', '1940', '3002', 'George Cukor', 'Cary Grant', 20.00), 
	('To Kill a Mockingbird', '1962', '3003', 'Robert Mulligan', 'Gregory Peck', 20.00), 
	('An American in Paris', '1951', '3007', 'Vincente Minnelli', 'Gene Kelly', 20.00), 
	('The Best Years of Our Lives', '1946', '3003', 'William Wyler', 'Myrna Loy', 20.00), 
	('My Fair Lady', '1964', '3003', 'George Cukor', 'Audrey Hepburn', 20.00), 
	('A Clockwork Orange', '1971', '3010', 'Stanley Kubrick', 'Malcom McDowell', 20.00), 
	('Doctor Zhivago', '1965', '3003', 'David Lean', 'Omar Sharif', 20.00), 
	('The Searchers', '1956', '3009', 'John Ford', 'John Wayne', 20.00), 
	('Jaws', '1975', '3008', 'Steven Spielberg', 'Roy Scheider', 20.00), 
	('Patton', '1970', '3003', 'Franklin J. Schaffner', 'George C. Scott', 20.00), 
	('Butch Cassidy and the Sundance Kid', '1969', '3003', 'George Roy Hill', 'Paul Newman', 20.00), 
	('The Treasure of the Sierra Madre', '1948', '3009', 'John Huston', 'Humphrey Bogart', 20.00), 
	('The Good, the Bad and the Ugly', '1966', '3009', 'Sergio Leone', 'Clint Eastwood', 20.00), 
	('The Apartment', '1960', '3002', 'Billy Wilder', 'Jack Lemmon', 20.00), 
	('Platoon', '1986', '3003', 'Oliver Stone', 'Charlie Sheen', 20.00), 
	('High Noon', '1952', '3009', 'Fred Zinnemann', 'Gary Cooper', 20.00), 
	('Braveheart', '1995', '3003', 'Mel Gibson', 'Mel Gibson', 20.00), 
	('Dances with Wolves', '1990', '3009', 'Kevin Costner', 'Keven Costner', 0.00), 
	('Jurassic Park', '1993', '3001', 'Steven Spielberg', 'Sam Neill', 20.00), 
	('The Exorcist', '1973', '3005', 'William Friedkin', 'Linda Blair', 20.00), 
	('The Pianist', '2002', '3003', 'Roman Polanski', 'Adrien Brody', 20.00), 
	('Goodfellas', '1990', '3003', 'Martin Scorsese', 'Robert De Niro', 20.00), 
	('The Deer Hunter', '1978', '3003', 'Michael Cimino', 'Robert De Niro', 20.00), 
	('All Quiet on the 3009 Front', '1930', '3003', 'Lewis Milestone', 'Lew Ayres', 20.00), 
	('Bonnie and Clyde', '1967', '3001', 'Arthur Penn', 'Warren Beatty', 20.00), 
	('The French Connection', '1971', '3001', 'William Friedkin', 'Gene Hackman', 20.00), 
	('City Lights', '1931', '3002', 'Charles Chaplin', 'Charles Chaplin', 20.00), 
	('It Happened One Night', '1934', '3007', 'Frank Capra', 'Clark Gable', 20.00), 
	('A Place in the Sun', '1951', '3007', 'George Stevens', 'Montgomery Clift', 20.00), 
	('Midnight Cowboy', '1969', '3003', 'John Schlesinger', 'Dustin Hoffman', 20.00), 
	('Mr. Smith Goes to Washington', '1939', '3002', 'Frank Capra', 'James Stewart', 20.00), 
	('Rain Man', '1988', '3003', 'Barry Levinson', 'Dustin Hoffman', 20.00), 
	('Annie Hall', '1977', '3007', 'Woody Allen', 'Woody Allen', 20.00), 
	('Fargo', '1996', '3008', 'Joel Coen', 'William H. Macy', 20.00), 
	('Giant', '1956', '3009', 'George Stevens', 'Elizabeth Taylor', 20.00), 
	('Shane', '1953', '3009', 'George Stevens', 'Alan Ladd', 20.00), 
	('The Grapes of Wrath', '1940', '3003', 'John Ford', 'Henry Fonda', 20.00), 
	('The Green Mile', '1999', '3003', 'Frank Darabont', 'Tom Hanks', 20.00), 
	('Close Encounters of the Third Kind', '1977', '3010', 'Steven Spielberg', 'Richard Dreyfuss', 20.00), 
	('Nashville', '1975', '3002', 'Robert Altman', 'Keith Carradine', 20.00), 
	('Network', '1976', '3003', 'Sidney Lumet', 'Faye Dunaway', 20.00), 
	('The Graduate', '1967', '3002', 'Mike Nichols', 'Dustin Hoffman', 20.00), 
	('American Graffiti', '1973', '3002', 'George Lucas', 'Richard Dreyfuss', 20.00), 
	('Pulp Fiction', '1994', '3003', 'Quentin Tarantino', 'John Travolta', 20.00), 
	('Terms of Endearment', '1983', '3002', 'James L. Brooks', 'Shirley MacLaine', 20.00), 
	('Good Will Hunting', '1997', '3003', 'Gus Van Sant', 'Robin Williams', 20.00), 
	('The African Queen', '1951', '3003', 'John Huston', 'Humphrey Bogart', 20.00), 
	('Stagecoach', '1939', '3009', 'John Ford', 'John Wayne', 20.00), 
	('Mutiny on the Bounty', '1935', '3003', 'Frank Lloyd', 'Clark Gable', 20.00), 
	('The Great Dictator', '1940', '3002', 'Charles Chaplin', 'Charles Chaplin', 20.00), 
	('Double Indemnity', '1944', '3003', 'Billy Wilder', 'Fred MacMurray', 20.00), 
	('The Maltese Falcon', '1941', '3006', 'John Huston', 'Humphrey Bogart', 20.00), 
	('Wuthering Heights', '1939', '3007', 'William Wyler', 'Merle Oberon', 20.00), 
	('Taxi Driver', '1976', '3003', 'Martin Scorsese', 'Robert De Niro', 20.00), 
	('Rear Window', '1954', '3008', 'Alfred Hitchcock', 'James Stewart', 20.00), 
	('The Third Man', '1949', '3006', 'Carol Reed', 'Orson Welles', 20.00), 
	('Rebel Without a Cause', '1955', '3003', 'Nicholas Ray', 'James Dean', 20.00), 
	('North by Northwest', '1959', '3008', 'Alfred Hitchcock', 'Cary Grant', 20.00), 
	('Yankee Doodle Dandy', '1942', '3003', 'Michael Curtiz', 'James Cagney', 20.00);
GO


--Insert Data Into Customer Table
INSERT INTO Customer 
	(CUS_FirstName, CUS_LastName, CUS_Address, CUS_City, CUS_State, CUS_Zip, CUS_Phone, CUS_Email) 
VALUES 
	('Dacie', 'Winborn', '3 Columbus Place', 'Gainesville', 'FL', '73945', '3525028081', 'dwinborn0@state.gov'),
	('Duncan', 'Musterd', '418 Ruskin Center', 'Dallas', 'TX', '12486', '9723966758', 'dmusterd1@blogs.com'),
	('Britney', 'Deshon', '8643 Lyons Road', 'Dearborn', 'MI', '97687', '7347207495', 'bdeshon2@elpais.com'),
	('Fanya', 'Sehorsch', '48010 Hintze Crossing', 'Fort Wayne', 'IN', '87643', '2603988047', 'fsehorsch3@huffingtonpost.com'),
	('Delmore', 'Charlwood', '51 Anthes Pass', 'Denver', 'CO', '00683', '3034730486', 'dcharlwood4@narod.ru'),
	('Vivianna', 'Dugan', '90864 Merrick Lane', 'Birmingham', 'AL', '26078', '2054464372', 'vdugan5@state.tx.us'),
	('Fredia', 'Rawstron', '055 Grim Parkway', 'Columbia', 'MO', '28591', '5735093497', 'frawstron6@apache.org'),
	('Joyann', 'Durran', '287 Sunfield Way', 'Glendale', 'AZ', '71079', '6024632124', 'jdurran7@so-net.ne.jp'),
	('Abrahan', 'Maylam', '79015 Susan Circle', 'Lancaster', 'CA', '27699', '6612213583', 'amaylam8@harvard.edu'),
	('Mireielle', 'Rooksby', '340 Briar Crest Street', 'Topeka', 'KS', '86523', '7855623558', 'mrooksby9@bing.com'),
	('Chelsy', 'Heymann', '337 Tennyson Lane', 'White Plains', 'NY', '24064', '9146322528', 'cheymanna@macromedia.com'),
	('Emelita', 'Ibbitt', '99073 Cordelia Plaza', 'Irvine', 'CA', '17273', '7148951978', 'eibbittb@twitpic.com'),
	('Gayler', 'Smeath', '57 Muir Terrace', 'Atlanta', 'GA', '27219', '7704879247', 'gsmeathc@ifeng.com'),
	('Dorris', 'Derham', '26091 Bowman Circle', 'Philadelphia', 'PA', '36909', '2159332331', 'dderhamd@github.io'),
	('Delinda', 'Di Baudi', '04125 Meadow Vale Court', 'Charlotte', 'NC', '79093', '7049731797', 'ddibaudie@uol.com.br'),
	('Desmund', 'Monks', '1 Oak Valley Place', 'Garden Grove', 'CA', '63209', '7142753664', 'dmonksf@businessweek.com'),
	('Birgit', 'Steinson', '2 Eagan Trail', 'Erie', 'PA', '11721', '8144724011', 'bsteinsong@macromedia.com'),
	('Cathleen', 'Siflet', '14282 Scofield Way', 'Charleston', 'WV', '17282', '3044915404', 'csifleth@yale.edu'),
	('Sorcha', 'Roller', '9 Bashford Way', 'Lubbock', 'TX', '00108', '8062546412', 'srolleri@unicef.org'),
	('Rochette', 'Billborough', '574 Cottonwood Pass', 'Toledo', 'OH', '39950', '4194349202', 'rbillboroughj@twitpic.com'),
	('Evita', 'Birrel', '83407 Sycamore Park', 'Jamaica', 'NY', '03000', '5163286715', 'ebirrelk@miibeian.gov.cn'),
	('Silvanus', 'Bjorkan', '56034 Amoth Alley', 'Dallas', 'TX', '84496', '9724334691', 'sbjorkanl@chron.com'),
	('Stephie', 'Chaloner', '89360 Emmet Hill', 'Milwaukee', 'WI', '85619', '4147189174', 'schalonerm@mozilla.org'),
	('Geri', 'Baudin', '16 Declaration Hill', 'Saginaw', 'MI', '68575', '9894711115', 'gbaudinn@php.net'),
	('Tamma', 'Cramer', '48498 Dixon Lane', 'Oklahoma City', 'OK', '72594', '4059843337', 'tcramero@amazonaws.com'),
	('Orv', 'Seyffert', '14732 Nancy Alley', 'New Hyde Park', 'NY', '81491', '5165931581', 'oseyffertp@shop-pro.jp'),
	('Roxi', 'Clearley', '91149 Declaration Junction', 'Harrisburg', 'PA', '84839', '7171427036', 'rclearleyq@digg.com'),
	('Lanita', 'Ballinghall', '66 Farmco Center', 'Oklahoma City', 'OK', '87896', '4059415926', 'lballinghallr@sogou.com'),
	('Findlay', 'Simmens', '5 Maryland Center', 'Asheville', 'NC', '86753', '8286577378', 'fsimmenss@discuz.net'),
	('Jackquelin', 'Pellant', '0 Mallory Terrace', 'Greensboro', 'NC', '91078', '3361521012', 'jpellantt@webnode.com'),
	('Ivy', 'Paddle', '6565 Union Road', 'Lakeland', 'FL', '55729', '8633501413', 'ipaddleu@de.vu'),
	('Ricky', 'Ghent', '7024 Vermont Street', 'Springfield', 'MO', '23674', '4179943788', 'rghentv@ezinearticles.com'),
	('Winona', 'Catmull', '188 Glendale Avenue', 'Fort Lauderdale', 'FL', '61245', '7543184470', 'wcatmullw@youku.com'),
	('Benjie', 'Molen', '1 Orin Trail', 'Scranton', 'PA', '39945', '5701612641', 'bmolenx@google.es'),
	('Maddy', 'Sommerling', '2168 Eagle Crest Junction', 'Denver', 'CO', '24708', '7203583378', 'msommerlingy@wsj.com'),
	('Brita', 'Timmens', '1 Independence Place', 'Akron', 'OH', '34930', '2349183644', 'btimmensz@vkontakte.ru'),
	('Lizzie', 'Di Gregorio', '30 La Follette Alley', 'Mobile', 'AL', '90730', '2512395590', 'ldigregorio10@wisc.edu'),
	('Curtis', 'Lyddon', '17123 Morning Place', 'Roanoke', 'VA', '18282', '5408079972', 'clyddon11@eepurl.com'),
	('Corine', 'Reignould', '3506 Spenser Plaza', 'New York City', 'NY', '41544', '6469015450', 'creignould12@sitemeter.com'),
	('Van', 'Bearfoot', '0291 Magdeline Terrace', 'Montgomery', 'AL', '61467', '3344506709', 'vbearfoot13@usda.gov'),
	('Blair', 'Petrelli', '9813 Londonderry Way', 'Evansville', 'IN', '99962', '8129682697', 'bpetrelli14@utexas.edu'),
	('Carlyle', 'Greenland', '37222 Kennedy Court', 'Bradenton', 'FL', '94564', '9417210124', 'cgreenland15@rambler.ru'),
	('Goldie', 'Stirman', '36 8th Court', 'Saint Paul', 'MN', '10316', '6517341438', 'gstirman16@furl.net'),
	('Lukas', 'Mordue', '193 Welch Court', 'San Bernardino', 'CA', '28265', '9094202973', 'lmordue17@google.it'),
	('Vere', 'Tregian', '51 Lakewood Point', 'Albany', 'NY', '58335', '5182873121', 'vtregian18@list-manage.com'),
	('Tarrah', 'Cluatt', '2034 Buhler Street', 'Los Angeles', 'CA', '54205', '2134967911', 'tcluatt19@constantcontact.com'),
	('Ruperto', 'Sherlock', '3919 Amoth Trail', 'San Antonio', 'TX', '26548', '2106163742', 'rsherlock1a@weibo.com'),
	('Brett', 'Siemandl', '86581 Lunder Lane', 'Toledo', 'OH', '88014', '4198825257', 'bsiemandl1b@xrea.com'),
	('Iosep', 'Philipeaux', '2333 Jana Court', 'Waterloo', 'IA', '65150', '3195091534', 'iphilipeaux1c@nytimes.com'),
	('Ellis', 'Folshom', '53 Cambridge Hill', 'San Bernardino', 'CA', '55547', '9512463398', 'efolshom1d@purevolume.com'),
	('Marylou', 'Bubbins', '8221 Pearson Street', 'Louisville', 'KY', '73948', '5024064081', 'mbubbins1e@ning.com'),
	('Holden', 'Saynor', '98 Dryden Pass', 'Salt Lake City', 'UT', '12755', '8011609384', 'hsaynor1f@bloomberg.com'),
	('Cleveland', 'Epine', '39 Dahle Crossing', 'Garland', 'TX', '49634', '4698398606', 'cepine1g@dailymail.co.uk'),
	('Angie', 'Fenty', '01 Oxford Street', 'Burbank', 'CA', '45242', '6261527789', 'afenty1h@diigo.com'),
	('Yardley', 'Mandry', '5 Reinke Plaza', 'Lawrenceville', 'GA', '71734', '6788064958', 'ymandry1i@msu.edu'),
	('Lisbeth', 'Goldstone', '4162 Milwaukee Plaza', 'Toledo', 'OH', '30825', '4191147883', 'lgoldstone1j@lycos.com'),
	('Stanley', 'McSparran', '072 Fair Oaks Center', 'Omaha', 'NE', '53373', '4021515704', 'smcsparran1k@umn.edu'),
	('Karlene', 'Levay', '817 Forest Run Park', 'Houston', 'TX', '54036', '7135444668', 'klevay1l@istockphoto.com'),
	('Dionisio', 'Dundin', '5696 Heffernan Lane', 'El Paso', 'TX', '09002', '9156344646', 'ddundin1m@topsy.com'),
	('Gerhardine', 'Gudyer', '5 Melby Parkway', 'Albany', 'NY', '19899', '5186699735', 'ggudyer1n@nifty.com'),
	('Joshia', 'Doxsey', '89569 Anniversary Alley', 'Fresno', 'CA', '01420', '5596921529', 'jdoxsey1o@comsenz.com'),
	('Moe', 'Davidof', '28 Jana Point', 'Atlanta', 'GA', '98201', '4041264003', 'mdavidof1p@oaic.gov.au'),
	('Engelbert', 'Togwell', '30 American Ash Plaza', 'San Diego', 'CA', '15951', '6193811045', 'etogwell1q@slashdot.org'),
	('Lorilee', 'Letch', '445 Crest Line Road', 'Washington', 'DC', '99992', '2027033641', 'lletch1r@un.org'),
	('Glynnis', 'Wykey', '93402 Springs Lane', 'Cincinnati', 'OH', '44413', '5138711399', 'gwykey1s@bizjournals.com'),
	('Jocelyn', 'Ensley', '191 Killdeer Trail', 'Saint Paul', 'MN', '28808', '6512758602', 'jensley1t@google.ru'),
	('Genna', 'Enterlein', '80220 Utah Lane', 'Orlando', 'FL', '54682', '4071447850', 'genterlein1u@i2i.jp'),
	('Miller', 'MacCook', '25031 Chinook Lane', 'Boise', 'ID', '85477', '2084844263', 'mmaccook1v@oracle.com'),
	('Welch', 'Gillio', '7 Pine View Point', 'Madison', 'WI', '82707', '6081577402', 'wgillio1w@microsoft.com'),
	('Gladys', 'Greave', '021 Hovde Park', 'Lexington', 'KY', '85542', '8591508926', 'ggreave1x@google.co.jp'),
	('Kermy', 'Egarr', '90964 Straubel Trail', 'Mansfield', 'OH', '34487', '4194032586', 'kegarr1y@jimdo.com'),
	('Cal', 'Temple', '24521 Bowman Plaza', 'Lubbock', 'TX', '08906', '8066473398', 'ctemple1z@zimbio.com'),
	('Goldia', 'Brabban', '75215 Moulton Pass', 'San Francisco', 'CA', '48682', '4155357000', 'gbrabban20@opensource.org'),
	('Octavius', 'Apperley', '7 Waxwing Drive', 'Las Vegas', 'NV', '43229', '7028681293', 'oapperley21@surveymonkey.com'),
	('Decca', 'Greening', '45 Walton Way', 'Dallas', 'TX', '72134', '9724850536', 'dgreening22@youku.com'),
	('Margit', 'Mucci', '96 Tennyson Center', 'Kent', 'WA', '21289', '4254559310', 'mmucci23@symantec.com'),
	('Trey', 'Hoggan', '44822 Dawn Circle', 'Denver', 'CO', '95181', '7206656270', 'thoggan24@comcast.net'),
	('Guillaume', 'Haney`', '8 Monterey Place', 'Clearwater', 'FL', '44985', '7276601203', 'ghaney25@state.tx.us'),
	('Thom', 'Trownson', '15537 Mosinee Point', 'Houston', 'TX', '18122', '2141144099', 'ttrownson26@geocities.jp'),
	('Lynelle', 'Normavill', '9487 Vidon Lane', 'Schenectady', 'NY', '59988', '5189653449', 'lnormavill27@ucoz.com'),
	('Dora', 'Swainsbury', '7554 Sullivan Terrace', 'Denver', 'CO', '11673', '7207967519', 'dswainsbury28@forbes.com'),
	('Roshelle', 'MacQuaker', '653 Mockingbird Junction', 'Miami', 'FL', '18169', '7863395137', 'rmacquaker29@zimbio.com'),
	('Alyda', 'Caldero', '02186 Shasta Court', 'Phoenix', 'AZ', '06995', '6028392822', 'acaldero2a@tumblr.com'),
	('Forest', 'Mordie', '1655 Riverside Pass', 'West Hartford', 'CT', '50320', '8606857971', 'fmordie2b@storify.com'),
	('Carson', 'Klicher', '055 Cambridge Junction', 'Springfield', 'IL', '78617', '2176684320', 'cklicher2c@cisco.com'),
	('Katheryn', 'Baudouin', '94119 Crownhardt Alley', 'Seattle', 'WA', '95269', '2067836303', 'kbaudouin2d@cafepress.com'),
	('Tanner', 'Deville', '5 Colorado Place', 'Clearwater', 'FL', '22034', '7279547824', 'tdeville2e@de.vu'),
	('Cirilo', 'Caldera', '588 Birchwood Way', 'Wilmington', 'DE', '83871', '3026273420', 'ccaldera2f@mysql.com'),
	('Antonie', 'Kilcoyne', '52 Sutherland Trail', 'Pasadena', 'CA', '28528', '6264381499', 'akilcoyne2g@parallels.com'),
	('Yehudit', 'Chardin', '22849 Surrey Alley', 'New Hyde Park', 'NY', '34782', '5169784515', 'ychardin2h@goodreads.com'),
	('Banky', 'Elner', '46269 Walton Court', 'Sacramento', 'CA', '76018', '9168180389', 'belner2i@miitbeian.gov.cn'),
	('Cesya', 'Marzella', '0311 Reinke Crossing', 'Houston', 'TX', '28650', '2817618176', 'cmarzella2j@biglobe.ne.jp'),
	('Carlos', 'Stidston', '1 Lillian Junction', 'Gastonia', 'NC', '13001', '7046308628', 'cstidston2k@go.com'),
	('Dannie', 'Hradsky', '1 Bay Trail', 'Hamilton', 'OH', '76586', '9374466264', 'dhradsky2l@nytimes.com'),
	('Cathrine', 'Yurenev', '86 Hagan Way', 'Hagerstown', 'MD', '87900', '2406499150', 'cyurenev2m@t-online.de'),
	('Lek', 'Dain', '14 Kingsford Plaza', 'Vienna', 'VA', '61184', '5717352756', 'ldain2n@vk.com'),
	('Dodi', 'Havock', '2 Delaware Alley', 'Austin', 'TX', '37623', '5121438022', 'dhavock2o@ifeng.com'),
	('Cathryn', 'Gorriessen', '44932 Dorton Plaza', 'El Paso', 'TX', '27137', '9157665237', 'cgorriessen2p@opensource.org'),
	('Sibby', 'Turtle', '16665 Northport Terrace', 'Naples', 'FL', '53424', '2394200957', 'sturtle2q@scientificamerican.com'),
	('Demott', 'Kinnon', '7 Dennis Street', 'Lincoln', 'NE', '37938', '4027339979', 'dkinnon2r@yahoo.co.jp');
GO


--Insert Data Into Purchase Table
INSERT INTO Purchase
	(CustomerID, PUR_Date, PUR_Time)
VALUES
	(7035, '5/17/2021', '15:37:54'),
	(7071, '3/12/2021', '13:26:38'),
	(7015, '3/31/2021', '13:49:35'),
	(7027, '4/19/2021', '11:22:03'),
	(7088, '11/16/2021', '12:43:40'),
	(7014, '10/21/2021', '5:53:42'),
	(7068, '8/23/2021', '16:39:20'),
	(7064, '11/16/2021', '12:15:49'),
	(7016, '7/17/2021', '10:30:58'),
	(7005, '1/3/2022', '23:07:32'),
	(7064, '2/10/2021', '5:50:22'),
	(7089, '11/7/2021', '9:53:05'),
	(7024, '3/9/2021', '16:48:35'),
	(7096, '3/24/2021', '2:10:49'),
	(7069, '2/8/2021', '2:25:22'),
	(7021, '4/12/2021', '14:32:26'),
	(7087, '1/17/2022', '18:29:37'),
	(7054, '7/7/2021', '4:50:22'),
	(7065, '3/29/2021', '5:51:58'),
	(7039, '9/10/2021', '2:53:51');
GO


--Insert Data Into Movie_Purchase Table
INSERT INTO Movie_Purchase
	(MovieID, PurchaseID, MOP_Price, MOP_Quantity)
VALUES
	(1001, 5001, 140.00, 7),
	(1025, 5002, 120.00, 6),
	(1050, 5003, 20.00, 1),
	(1073, 5004, 160.00, 8),
	(1075, 5005, 100.00, 5),
	(1020, 5006, 20.00, 1),
	(1078, 5007, 60.00, 3),
	(1005, 5008, 120.00, 6),
	(1087, 5009, 20.00, 1),
	(1037, 5010, 20.00, 1),
	(1042, 5011, 40.00, 2),
	(1067, 5012, 40.00, 2),
	(1084, 5013, 120.00, 6),
	(1020, 5014, 20.00, 1),
	(1015, 5015, 140.00, 7),
	(1092, 5016, 80.00, 4),
	(1035, 5017, 100.00, 5),
	(1046, 5018, 160.00, 8),
	(1082, 5019, 100.00, 5),
	(1032, 5020, 100.00, 5);
GO