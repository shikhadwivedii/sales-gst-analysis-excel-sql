select * from Swiggy_Analysis   

SELECT 
    YEAR(CONVERT(datetime, order_time)) AS order_year,
    MONTH(CONVERT(datetime, order_time)) AS order_month,
    COUNT(order_id) AS total_orders
FROM Swiggy_Analysis
GROUP BY 
    YEAR(CONVERT(datetime, order_time)),
    MONTH(CONVERT(datetime, order_time))
ORDER BY order_year, order_month;


-- Monthly Orders Count
SELECT 
    FORMAT(CONVERT(datetime, order_time), 'yyyy-MM') AS month,
    COUNT(order_id) AS total_orders
FROM Swiggy_Analysis
GROUP BY FORMAT(CONVERT(datetime, order_time), 'yyyy-MM')
ORDER BY month;

-- Monthly Revenue
SELECT 
    FORMAT(CONVERT(datetime, order_time), 'yyyy-MM') AS month,
    SUM(net_total) AS total_revenue
FROM Swiggy_Analysis
GROUP BY FORMAT(CONVERT(datetime, order_time), 'yyyy-MM')
ORDER BY month;

-- Top 5 Restaurants by Revenue
SELECT TOP 5
    restaurant_name,
    SUM(net_total) AS total_revenue
FROM Swiggy_Analysis
GROUP BY restaurant_name
ORDER BY total_revenue DESC;


