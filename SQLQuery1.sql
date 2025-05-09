
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Sheet1$';

SELECT Date, 
       ("Subways: Total Estimated Ridership" + 
        "Buses: Total Estimated Ridership" + 
        "LIRR: Total Estimated Ridership" + 
        "Metro-North: Total Estimated Ridership" + 
        "Staten Island Railway: Total Estimated Ridership") AS Total_Ridership
FROM Sheet1$;

SELECT AVG("Subways: Total Estimated Ridership") AS Avg_Subway_Ridership
FROM Sheet1$;

SELECT TOP 5 "Date", "Subways: Total Estimated Ridership"
FROM Sheet1$
ORDER BY "Subways: Total Estimated Ridership" DESC;

SELECT TOP 5 "Date", "Subways: Total Estimated Ridership"
FROM Sheet1$
ORDER BY "Subways: Total Estimated Ridership" ASC;

SELECT COUNT(*) AS Low_Ridership_Days
FROM Sheet1$
WHERE "Subways: % of Comparable Pre-Pandemic Day" < 50;

SELECT "Date", 
       "Subways: % of Comparable Pre-Pandemic Day" AS Subway_Percentage,
       "Buses: % of Comparable Pre-Pandemic Day" AS Bus_Percentage
FROM Sheet1$;

SELECT TOP 5 "Date", 
       ("Subways: Total Estimated Ridership" + 
        "Buses: Total Estimated Ridership" + 
        "LIRR: Total Estimated Ridership" + 
        "Metro-North: Total Estimated Ridership" + 
        "Staten Island Railway: Total Estimated Ridership") AS Total_Ridership
FROM Sheet1$
ORDER BY Total_Ridership DESC;


SELECT "Date", SUM("Subways: Total Estimated Ridership") AS Daily_Ridership
FROM Sheet1$
GROUP BY "Date"
ORDER BY "Date";

SELECT DATEPART(YEAR, "Date") AS Year, DATEPART(WEEK, "Date") AS Week, 
       SUM("Subways: Total Estimated Ridership") AS Weekly_Ridership
FROM Sheet1$
GROUP BY DATEPART(YEAR, "Date"), DATEPART(WEEK, "Date")
ORDER BY Year, Week;

SELECT DATEPART(YEAR, "Date") AS Year, DATEPART(MONTH, "Date") AS Month, 
       SUM("Subways: Total Estimated Ridership") AS Monthly_Ridership
FROM Sheet1$
GROUP BY DATEPART(YEAR, "Date"), DATEPART(MONTH, "Date")
ORDER BY Year, Month;

SELECT DATEPART(YEAR, "Date") AS Year, DATEPART(QUARTER, "Date") AS Quarter, 
       SUM("Subways: Total Estimated Ridership") AS Seasonal_Ridership
FROM Sheet1$
GROUP BY DATEPART(YEAR, "Date"), DATEPART(QUARTER, "Date")
ORDER BY Year, Quarter;

SELECT YEAR("Date") AS Year, 
       AVG("Subways: Total Estimated Ridership") AS Avg_Ridership, 
       LAG(AVG("Subways: Total Estimated Ridership")) OVER (ORDER BY YEAR("Date")) AS Prev_Year_Ridership,
       (AVG("Subways: Total Estimated Ridership") - LAG(AVG("Subways: Total Estimated Ridership")) OVER (ORDER BY YEAR("Date"))) AS Growth
FROM Sheet1$
GROUP BY YEAR("Date")
ORDER BY Year;

 SELECT "Date", "Subways: Total Estimated Ridership"
FROM Sheet1$
WHERE "Date" BETWEEN '2020-03-01' AND '2021-12-31'
ORDER BY "Date";

SELECT CASE 
          WHEN DATEPART(WEEKDAY, "Date") IN (1, 7) THEN 'Weekend'
          ELSE 'Weekday'
       END AS Day_Type,
       AVG("Subways: Total Estimated Ridership") AS Avg_Ridership
FROM Sheet1$
GROUP BY CASE 
          WHEN DATEPART(WEEKDAY, "Date") IN (1, 7) THEN 'Weekend'
          ELSE 'Weekday'
       END;

SELECT 'Subways' AS Mode, SUM([Subways: Total Estimated Ridership]) AS Total_Ridership FROM Sheet1$
UNION ALL
SELECT 'Buses', SUM([Buses: Total Estimated Ridership]) FROM Sheet1$
UNION ALL
SELECT 'LIRR', SUM([LIRR: Total Estimated Ridership]) FROM Sheet1$
UNION ALL
SELECT 'Metro-North', SUM([Metro-North: Total Estimated Ridership]) FROM Sheet1$
UNION ALL
SELECT 'Staten Island Railway', SUM([Staten Island Railway: Total Estimated Ridership]) FROM Sheet1$
ORDER BY Total_Ridership DESC;


SELECT [Date], 
       [Bridges and Tunnels: Total Traffic] AS Car_Traffic, 
       [Subways: Total Estimated Ridership] AS Subway_Ridership
FROM Sheet1$
ORDER BY [Date];

SELECT MONTH([Date]) AS Month, 
       SUM([Subways: Total Estimated Ridership]) AS Total_Ridership
FROM Sheet1$
GROUP BY MONTH([Date])
ORDER BY Total_Ridership DESC;

SELECT [Date], 
       [Subways: Total Estimated Ridership] AS Subway, 
       [Buses: Total Estimated Ridership] AS Bus, 
       [LIRR: Total Estimated Ridership] AS LIRR, 
       [Metro-North: Total Estimated Ridership] AS Metro_North,
       [Staten Island Railway: Total Estimated Ridership] AS Staten_Island
FROM Sheet1$
ORDER BY [Date];

SELECT [Date], 
       [Bridges and Tunnels: Total Traffic] AS Bridge_Traffic, 
       [Subways: Total Estimated Ridership] AS Subway_Ridership
FROM Sheet1$
ORDER BY [Date];