-- THERE ARE THREE DIFFERENT SOURCES IN ORDER TO QUERY THE DATE TIME
 -- #1 DATA COLUMN FROM A TABLE
	SELECT 
		OrderID,
		CreationTime
	FROM Sales.Orders;

-- #2 HARDCODED CONSTANT STRING VALUE
	SELECT 
		OrderID,
		CreationTime,
		'2025-07-25' Hardcoded
	FROM Sales.Orders;

-- #3 GETDATE() FUNCTION
	SELECT 
		OrderID,
		CreationTime,
		GETDATE() Today
	FROM Sales.Orders;
	  
	--  DATE AND TIME FUNCTION
	-- WE HAVE THREE TYPES OF FUNCTION
	-- #1 PART EXTRACTION #2 FORMAT & CASTING #3 CALCULATION #4 VALIDATION

	   -- #1 PART EXTRACTION( DAY,MONTH,YEAR & EOMONTH)
  SELECT 
		OrderID,
		CreationTime,
		YEAR(CreationTime) AS Year,
		MONTH(CreationTime) AS Month,
		DAY(CreationTime) AS Day
	FROM Sales.Orders;

	 -- #1 PART EXTRACTION(DATEPART)
	 SELECT 
		OrderID,
		CreationTime,
		DATEPART(year,CreationTime) AS Year_dp,
		DATEPART(month,CreationTime) AS Month_dp,
		DATEPART(day,CreationTime) AS Day_dp,
		DATEPART(hour,CreationTime) AS hour_dp,
		DATEPART(quarter,CreationTime) AS quarter_dp,
		DATEPART(week,CreationTime) AS week_dp
	FROM Sales.Orders;

	 -- #1 PART EXTRACTION(DATENAME)
	 SELECT 
		OrderID,
		CreationTime,
		DATENAME(month, CreationTime) AS Month_name,
		DATENAME(weekday,CreationTime) AS weekday_name,
		DATENAME(day,CreationTime) AS day_name
	FROM Sales.Orders;

 -- #1 PART EXTRACTION(DATETRUNC)
  SELECT 
		OrderID,
		CreationTime,
		DATETRUNC(year,CreationTime) year_dt,
		DATETRUNC(month,CreationTime) month_dt,
		DATETRUNC(day,CreationTime) day_dt,
		DATETRUNC(hour,CreationTime) hour_dt,
		DATETRUNC(minute,CreationTime) minute_dt
	FROM Sales.Orders;

	-- WHEN WE WILL USE DATE TRUNCATE IN DATA ANALAYTICS?
	 -- EXAMPLES
	 -- THIS IS AT MINUTE LEVEL SO WE'LLL HAVE ONLY 1 CREATION
	 SELECT 
		CreationTime,
		COUNT(*)
	FROM 
		Sales.Orders
	GROUP BY 
		CreationTime;

		-- LET US TRY AT MONTH LEVEL
	SELECT 
		DATETRUNC(month,CreationTime),
		COUNT(*) AS creation
	FROM 
		Sales.Orders
	GROUP BY 
		DATETRUNC(month,CreationTime);

	-- LET US TRY AT YEAR LEVEL 
	SELECT 
		DATETRUNC(year,CreationTime),
		COUNT(*) AS creation
	FROM 
		Sales.Orders
	GROUP BY 
		DATETRUNC(year,CreationTime);

	-- #1 PART EXTRACTION(EOMONTH)
	 SELECT 
		OrderID,
		CreationTime,
		EOMONTH(CreationTime) AS EndOfMonth
	FROM 
		Sales.Orders;

		-- SQL TASKS
	-- HOW MANY ORDERS PLACED EACH YEAR ?
	SELECT 
		YEAR(CreationTime) AS year,
		COUNT(*) AS Num_of_orders
	FROM 
		Sales.Orders
	GROUP BY
		YEAR(CreationTime);

		-- HOW MANY ORDERS PLACED EACH MONTH ?
	SELECT 
		DATENAME(month,CreationTime) AS month,
		COUNT(*) AS Num_of_orders
	FROM 
		Sales.Orders
	GROUP BY
		DATENAME(month,CreationTime);

	-- SHOW ALL ORDERS THAT WERE PLACED DURING THE MONTH OF FEBRUARY
	SELECT 
		DATENAME(month,CreationTime) AS month,
		COUNT(*) AS Num_of_orders
	FROM 
		Sales.Orders
	WHERE 
		DATENAME(month,CreationTime) = 'February'
	GROUP BY
		DATENAME(month,CreationTime);
		  -- OR
	SELECT 
		*
	FROM  
		Sales.Orders
	WHERE 
		MONTH(OrderDate) = 2;

	--	#2 FORMAT & CASTING(FORMAT)
	-- SYNTAX:  FORMAT(value,format [,culture(optional)])
	-- EXAMPLE 1: FORMAT(orderDate,'dd/MM/yyy')
	-- EXAMPLE 2: FORMAT(orderDate,'dd/MM/yyy','ja-JP')
	SELECT 
		OrderID,
		CreationTime,
		FORMAT(CreationTime,'MM-dd-yyyy') AS USA_Format,
		FORMAT(CreationTime,'dd-MM-yyyy') AS Europian_Format,
		FORMAT(CreationTime,'dd') dd,
		FORMAT(CreationTime,'ddd') ddd,
		FORMAT(CreationTime,'dddd') dddd,
		FORMAT(CreationTime,'MM') mm,
		FORMAT(CreationTime,'MMM') mmm,
		FORMAT(CreationTime,'MMMM') mmmm
	FROM Sales.Orders;

	-- SQL TASKS
	/*  SHOW CREATION TIME IN THE FOLLOWING FORMAT:
	Day Wed Jan Q1 2025 12:34:56 PM
	*/

	SELECT 
		OrderID,
		CreationTime,
	'Day '+FORMAT(CreationTime,'ddd MMM') +' Q'+ DATENAME(quarter,CreationTime)+' '
	+ FORMAT(CreationTime,'yyyy hh:mm:ss tt') AS Custom_Format
	FROM Sales.Orders;

	--	#2 FORMAT & CASTING(CONVERT)
	-- SYNTAX: CONVERT(Data_type,value [,style(optional)])
	-- EXAMPLE 1: CONVERT(INT,'123')
	-- EXAMPLE 1: CONVERT(VARCHAR,ORDERDATE,'34')

SELECT
	CreationTime,
	CONVERT(date,CreationTime) AS datetime_to_date,
	CONVERT(VARCHAR,CreationTime,32) AS [USA Std. style:32],
	CONVERT(VARCHAR,CreationTime,34) AS [EURO Std. style:34]
FROM 
	Sales.Orders;

	--	#2 FORMAT & CASTING(CAST)
	-- SYNTAX: CAST(value AS data_type)
	-- EXAMPLE: CAST('123' AS INT)
	SELECT
		CAST('123' AS INT) AS [str to int],
		CAST(123 AS VARCHAR) AS [int to str],
		CAST('2024-08-22' AS DATE) AS [str to date],
		CAST('2024-08-22' AS DATETIME) AS [str to datetime],
		CreationTime,
		CAST(CreationTime AS DATE) [datetime to date]
	FROM
		Sales.Orders;

		-- #3 CALCULATION (DATEADD)
		-- SYNTAX: DATEADD(part,interval,date)
		-- EXAMPLE 1: DATEADD(year,2,orderDate)
		-- EXAMPLE 2: DATEADD(year,-2,orderDate)

		SELECT 
			OrderID,
			OrderDate,
		DATEADD(day,-10,OrderDate) AS [Ten days before],
		DATEADD(month,3,OrderDate) AS [Three months later],
		DATEADD(year,2,OrderDate) AS [Two years later]
		FROM 
			Sales.Orders;

		-- #3 DATE CALCULATION (DATEDIFF) Find the difference between two dates

		-- SYNTAX: DATEDIFF(part,start_date,end_date)
		-- EXAMPLE 1: DATEDIFF(year,orderDate,shipDate)
		-- EXAMPLE 2: DATEDIFF(day,orderDate,shipDate)

			-- SQL TASKS
		-- Calculate the ages of employees

		SELECT
			EmployeeID,
			FirstName,
			BirthDate,
		DATEDIFF(year,BirthDate,GETDATE()) AS [Employees age]
		FROM 
			Sales.Employees;

	-- FIND THE AVERAGE SHIPPING DURATION IN DAYS FOR EACH MONTH
	SELECT
		DATENAME(month,ShipDate) AS [months dn],
	    AVG(DATEDIFF(day,OrderDate,ShipDate)) AS [ship days]
	FROM Sales.Orders
	GROUP BY 
		DATENAME(month,ShipDate) ;

	-- FIND THE NUMBER OF DAYS BETWEEN EACH ORDER AND PREVIOUS ORDER
	SELECT 
		OrderID,
		OrderDate AS [Current date],
		LAG(OrderDate) OVER (ORDER BY OrderDate) AS [Previus date],
		DATEDIFF(day,LAG(OrderDate) OVER (ORDER BY OrderDate),OrderDate) AS [Num of days]
	FROM
			Sales.Orders;

			-- #4 DATE VALIDATION(ISDATE) RETURNS 1(true) or 0(false)
			-- SYNTAX: ISDATE(value)
			-- EXAMPLE 1: ISDATE('2026-08-25')
			-- EXAMPLE 2: ISDATE(2025)
			SELECT
				ISDATE('123') Datecheck1,
				ISDATE('2026-09-27') Datecheck2,
				ISDATE('27-09-2-26') Datecheck3, -- because this is not sql server staandard date format
				ISDATE(2025) Datecheck4,
				ISDATE('O9') Datecheck5;