--1.1 query
-- Columns needed: ProductId, Name, ProductNumber, size, color, ProductSubcategoryId, Subcategory name.
-- Order results by SubCategory name.
SELECT
      p.ProductID,
      p.Name,
      p.ProductNumber,
      p.Size,
      p.Color,
      p.ProductSubcategoryID,
      psc.Name AS Subcategory
FROM
`   adwentureworks_db.product` AS p
INNER JOIN
    `adwentureworks_db.productsubcategory` AS psc
ON
    psc.ProductSubcategoryID = p.ProductSubcategoryID
ORDER BY
    psc.Name;


 
-- 1.2 Querry
-- n 1.1 query you have a product subcategory but see that you could use the category name.

--Find and add the product category name.
--Afterwards order the results by Category name.
SELECT
      p.ProductID,
      p.Name,
      p.ProductNumber,
      p.Size,
      p.Color,
      p.ProductSubcategoryID,
      psc.Name AS Subcategory,
      pc.Name AS Category
FROM
    `adwentureworks_db.product` AS p
INNER JOIN
    `adwentureworks_db.productsubcategory` AS psc
ON
    psc.ProductSubcategoryID = p.ProductSubcategoryID
INNER JOIN
` adwentureworks_db.productcategory` AS pc
ON
    pc.ProductCategoryID = psc.ProductCategoryID
ORDER BY
pc.Name;


-- 1.3 query 
-- Order the results from most to least expensive bike.
SELECT
      p.ProductID,
      p.Name,
      p.ProductNumber,
      p.Size,
      p.Color,
      p.ProductSubcategoryID,
      psc.Name AS Subcategory,
      pc.Name AS Category
FROM
    `adwentureworks_db.product` AS p
INNER JOIN
    `adwentureworks_db.productsubcategory` AS psc
ON
    psc.ProductSubcategoryID = p.ProductSubcategoryID
INNER JOIN
    `adwentureworks_db.productcategory` AS pc
ON
    pc.ProductCategoryID = psc.ProductCategoryID
WHERE
    p.ListPrice > 2000
AND pc.Name = 'Bikes'
AND (p.SellEndDate IS NULL OR p.SellEndDate > CURRENT_DATE())
ORDER BY
    p.ListPrice DESC;


    -- 2.1 query
/* Create an aggregated query to select the:

Number of unique work orders.
Number of unique products.
Total actual cost.*/
SELECT 
  locationID,
  COUNT(DISTINCT WorkOrderID) AS UniqueWorkOrders,
  COUNT(DISTINCT ProductID) AS UniqueProducts,
  SUM(ActualCost) AS ActualCost
FROM
`adwentureworks_db.workorderrouting`
WHERE EXTRACT(YEAR FROM ActualStartDate) = 2004  AND EXTRACT(MONTH FROM ActualStartDate) = 1
GROUP BY LocationID
ORDER BY
ActualCost desc

-- 2.2 querry
-- adding the name of the location and also add the average days amount between actual start date and actual end date per each location.
SELECT 
      wor.LocationID,
      l.Name,
      COUNT(DISTINCT wor.WorkOrderID) AS UniqueWorkOrders,
      COUNT(DISTINCT wor.ProductID) AS UniqueProducts,
      SUM(wor.ActualCost) AS TotalActualCost,
      AVG(DATE_DIFF(wor.ActualEndDate, wor.ActualStartDate, DAY)) AS AvgDaysBetweenStartAndEnd
FROM
  `adwentureworks_db.workorderrouting` AS wor
JOIN 
  `adwentureworks_db.location` AS l 
ON 
  l.LocationID = wor.LocationID
WHERE   
  DATE_TRUNC(wor.ActualStartDate, MONTH) = '2004-01-01'
GROUP BY 
  wor.LocationID, l.Name
ORDER BY 
  TotalActualCost DESC;



  -- 2.3 query
  --Select all the expensive work Orders (above 300 actual cost) that happened throught January 2004.
SELECT 
      DISTINCT wor.WorkOrderID,
      wor.ProductID,
      wor.LocationID,
      l.Name AS LocationName,
      wor.ActualCost,
      wor.ActualStartDate,
      wor.ActualEndDate
FROM
  `adwentureworks_db.workorderrouting` AS wor
JOIN 
  `adwentureworks_db.location` AS l 
ON 
  l.LocationID = wor.LocationID
WHERE   
  DATE_TRUNC(wor.ActualStartDate, MONTH) = '2004-01-01'
ORDER BY 
  wor.WorkOrderID DESC;



-- 2.3 query
SELECT 
  wor.WorkOrderID,
  SUM(wor.ActualCost) AS TotalActualCost
FROM
  `adwentureworks_db.workorderrouting` AS wor
JOIN 
  `adwentureworks_db.location` AS l 
ON 
  l.LocationID = wor.LocationID
WHERE   
  DATE_TRUNC(wor.ActualStartDate, MONTH) = '2004-01-01'
GROUP BY
  wor.WorkOrderID
HAVING
  SUM(wor.ActualCost) > 300
ORDER BY 
  wor.WorkOrderID DESC;





