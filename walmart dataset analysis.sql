use walmart_dataset;

select * from walmart_dataset;

#Q1 What is the total sales, cost of goods sold (COGS), and gross income
SELECT 
    SUM(Total) AS TotalSales, 
    SUM(cogs) AS TotalCOGS, 
    SUM(`gross income`) AS TotalGrossIncome 
FROM walmart_dataset;

#Q2 What are the total sales by each branch
SELECT 
    Branch, 
    SUM(Total) AS TotalSales 
FROM walmart_dataset
GROUP BY Branch;

#Q3What is the average customer rating for each payment method
SELECT 
    Payment, 
    AVG(Rating) AS AvgRating 
FROM walmart_dataset
GROUP BY Payment;

#Q4How much sales are contributed by male and female customers
SELECT 
    Gender, 
    SUM(Total) AS TotalSales 
FROM walmart_dataset
GROUP BY Gender;

#Q5 What is the gross income generated in each city
SELECT 
    City, 
    SUM(`gross income`) AS TotalGrossIncome 
FROM walmart_dataset
GROUP BY City;

#Q6 Which product line generates the highest sales
SELECT 
    `Product line`, 
    SUM(Total) AS TotalSales 
FROM walmart_dataset
GROUP BY `Product line`
ORDER BY TotalSales DESC
LIMIT 1;

#Q7What is the hourly sales trend
SELECT 
    HOUR(STR_TO_DATE(Time, '%H:%i:%s')) AS Hour, 
    SUM(Total) AS TotalSales 
FROM walmart_dataset
GROUP BY Hour
ORDER BY Hour;

#Q8Which transactions (Invoice IDs) have a rating above 9
SELECT 
    `Invoice ID`, 
    Rating, 
    Total 
FROM walmart_dataset
WHERE Rating > 9;

#Q9 Which product line has the highest gross margin percentage
SELECT 
    `Product line`, 
    AVG(`gross margin percentage`) AS AvgGrossMargin 
FROM walmart_dataset
GROUP BY `Product line`
ORDER BY AvgGrossMargin DESC;

#10How does the gross income differ between Member and Normal customers
SELECT 
    `Customer type`, 
    SUM(`gross income`) AS TotalGrossIncome 
FROM walmart_dataset
GROUP BY `Customer type`;
