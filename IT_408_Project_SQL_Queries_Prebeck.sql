----///////////////////
----MovieRetail Database Queries
----Blake Prebeck
----IT 408 - Final Project - Database Queries
----///////////////////


----/////////////////////////////////////////////////////////
----RUN FIRST TO ENSURE INSIDE CORRECT DATABASE
----/////////////////////////////////////////////////////////

USE MASTER;
GO
USE MovieRetail;
GO


----///////////////////
----Queries
----///////////////////

----Query #1
----Shows all movies made by the Director whose name is like "Fra" and order by director name.
--SELECT MOV_Title as [Movie]
--		, MOV_Director as [Director]
--FROM Movie
--WHERE MOV_Director LIKE '%Fra%'
--ORDER BY MOV_Director;


----Query #2
----Shows the Last Name, First Name, City, and Email of all customers located in Denver, sorted by Last Name ascending.
--SELECT CUS_LastName AS [Last Name]
--		,CUS_FirstName AS [First Name]
--		,CUS_City AS [City]
--		,CUS_Email AS [E-Mail]
--FROM Customer
--WHERE CUS_City = 'Denver'
--ORDER BY CUS_LastName ASC;

----Query#3
----Shows how many movies of each genre type there are in the database.
--SELECT GEN_Type as [Genre]
--		,COUNT (*) as [Movies]
--FROM Movie M JOIN Genre G
--		ON M.GenreID = G.GenreID
--GROUP BY GEN_Type
--ORDER BY GEN_Type;

----Query #4
----Show all movies that are of the Horror genre.
--SELECT	MOV_Title AS [Title]
--			,GEN_Type AS [Genre]
--FROM Movie M JOIN Genre G
--		ON M.GenreID = G.GenreID
--WHERE GEN_Type = 'Horror'
--ORDER BY MOV_Title;


----Query #5
----Shows all of the Customers who have ordered more than the average amount of Movies Purchased, sorted by Movies Purcased descending, then by Last Name ascending.
--SELECT	CUS_LastName AS [Last Name]
--		,CUS_FirstName AS [First Name]
--		,MOP_Quantity AS [Movies Purchased]
--FROM Customer C JOIN Purchase P
--		ON C.CustomerID = P.CustomerID
--		JOIN Movie_Purchase MO
--		ON P.PurchaseID = MO.PurchaseID
--WHERE MOP_Quantity >= 
--		(SELECT AVG(MOP_Quantity)
--		from Movie_Purchase)
--ORDER BY MOP_Quantity DESC, CUS_LastName;