libname ruturaj "C:\Users\rmokashi\Documents\BusinessReportingTools-master\Extra_dataset";
run;

*// Q. 1 Give the number of managers at the company.*//; 

PROC SQL;

SELECT Title
FROM ruturaj.Employees
WHERE Title contains ('Manager');
quit;

* // Q.2 Give the number of (unique) artists who have an album with a second disc in it (“Disc 2”)*//;

PROC SQL;

SELECT DISTINCT ArtistId as album_disc_2 FROM ruturaj.Albums
WHERE Title contains ( 'Disc 2');
quit;


* // Q.3 Display the average number of tracks purchased per invoice?*//;

PROC SQL;
SELECT  sum(Quantity)/count(distinct InvoiceId) as average_tracks_per_Invoice
from ruturaj.Invoice_items; 
quit;

*// Q.4 Give the number of customers per country where the postal code is not “NA” and order by country *//;
PROC SQL;
SELECT count(CustomerId) as Number_of_Customers ,Country as country
From ruturaj.Customers
where PostalCode Contains("NA")
group by Country 
order by Country;
quit;

*// Q.5 Show the total amount invoiced *//;

PROC SQL;
SELECT sum(Total) as total_amount_invoiced
FROM ruturaj.Invoices;
quit;

*// Q.6 Show the total amount invoiced, per month and year, sort per month *//;

PROC SQL;
SELECT  MONTH(Datepart(InvoiceDate))as month, YEAR(Datepart(InvoiceDate))as year, sum(Total) as Total
FROM ruturaj.invoices
group by 1,2 
order by 2;
quit;

*// Q.7 Show the total number of invoices per customer in April 2009.*//;

PROC SQL ;
SELECT Count(InvoiceId) as Total_Invoices, CustomerId 
FROM ruturaj.invoices
Where month(datepart(InvoiceDate)) EQ 04 & year(datepart(InvoiceDate)) EQ 2009   
Group By CustomerId;
quit;

*// Q.8 Show the age of the employees if they are more than 25 years old, and also the time since they are working for the company *//;

PROC SQL;
SELECT INT(((TODAY()-Datepart(BirthDate))/365)) as age, INT(((TODAY()-Datepart(HireDate))/365)) as tenure
FROM ruturaj.Employees;
quit;

*// Q.9 Select all playlists that start with a ‘b’ *//;

PROC SQL;
SELECT Name as Playlist
FROM ruturaj.Playlists
WHERE Name Like 'B%';
quit;

*// Q.10 Select the number of corporate customers per country’ *//;

PROC SQL;
SELECT count(CustomerId)as no_of_cust, Country as country
FROM ruturaj.Customers
where Company <> "NA"
group by Country;
quit;

*// Q.11 Display for each invoice, the invoice number, the amount, and the percentage that this amount has contributed to the total amount invoiced.  *//;

PROC SQL;
SELECT InvoiceId as Invoice_id, Total as total, ((Total*100)/sum(Total)) as total_percent
FROM ruturaj.Invoices;
quit;




