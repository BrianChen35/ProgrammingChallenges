
# Problem 1
SELECT DATE(date) AS day, SUM(impressions) AS total_impressions
FROM marketing_data
GROUP BY DATE(date)
ORDER BY day;

# Problem 2
SELECT state, SUM(revenue) AS total_revenue
FROM website_revenue
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 3;
# The third best revenue is Ohio which generated $37,577.

# Problem 3
SELECT c.name AS campaign_name,
       SUM(mp.cost) AS total_cost,
       SUM(mp.impressions) AS total_impressions,
       SUM(mp.clicks) AS total_clicks,
       SUM(wr.revenue) AS total_revenue
FROM campaign_info c
INNER JOIN marketing_data mp ON c.id = mp.campaign_id
INNER JOIN website_revenue wr ON c.id = wr.campaign_id
GROUP BY c.name;

# Problem 4
SELECT wr.state, SUM(mp.conversions) AS total_conversions
FROM marketing_data mp
JOIN website_revenue wr ON mp.campaign_id = wr.campaign_id
WHERE mp.campaign_id = '99058240'
GROUP BY wr.state
ORDER BY total_conversions DESC;
# Georgia generated with the most conversions for this campaign with 3,342.

# Problem 5
SELECT c.name AS campaign_name,
       SUM(mp.cost) AS total_cost,
       SUM(mp.conversions) AS total_conversions,
       SUM(mp.cost) / SUM(mp.conversions) AS cost_per_conversion
FROM campaign_info c
INNER JOIN marketing_data mp ON c.id = mp.campaign_id
GROUP BY c.name
ORDER BY cost_per_conversion;

# For me, I meausre effciency by the cost per conversion which is how much it costs to acquire each conversion. 
# To find the most efficient campaign, I need to find the lowest cost per conversion and that is Campaign 4.

# Bonus
SELECT 
    DAYNAME(date) AS day_of_week,
    AVG(impressions) AS avg_impressions
FROM marketing_data
GROUP BY day_of_week
ORDER BY avg_impressions DESC;