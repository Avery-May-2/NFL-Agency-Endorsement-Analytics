SELECT
	p.player_name,
	b.brand_name,
	e.deal_value_m,
	dp.brand_revenue_lift_pct
FROM endorsement_deals e
JOIN players p ON e.player_id = p.player_id
JOIN brands b ON e.brand_id = b.brand_id
JOIN deal_performance dp ON e.deal_id = dp.deal_id
LIMIT 10;

-- Query 1: Portfolio Overview
SELECT count (*) AS player_count FROM players;
SELECT count (*) AS brand_count FROM brands;
SELECT count (*) AS deal_count FROM endorsement_deals;
SELECT count (*) AS performance_count FROM deal_performance;

-- Query 2: Total Portfolio Value
SELECT
	ROUND(SUM(deal_value_m), 2) AS total_portfolio_value_m,
	ROUND(AVG(deal_value_m), 2) AS avg_deal_value_m,
	ROUND(MIN(deal_value_m), 2) AS min_deal_value_m,
	ROUND (MAX(deal_value_m), 2) AS max_deal_value_m
FROM endorsement_deals;

-- Query 3: Total Deal Value by Brand industry
SELECT
	b.industry,
	COUNT(e.deal_id) AS number_of_deals,
	ROUND(SUM(e.deal_value_m), 2) AS total_deal_value_m,
	ROUND(AVG(e.deal_value_m), 2) AS avg_deal_value_m
FROM endorsement_deals e
JOIN brands b ON e.brand_id = b.brand_id
GROUP BY b.industry
ORDER BY total_deal_value_m DESC;

-- Query 4: Top 10 Most Valuable Deals
SELECT 
	p.player_name,
	p.position,
	b.brand_name,
	b.industry,
	e.deal_year,
	e.deal_value_m,
	e.deal_type,
	e.exclusivity
FROM endorsement_deals e
JOIN players p ON e.player_id = p.player_id
JOIN brands b ON e.brand_id = b.brand_id
ORDER BY e.deal_value_m DESC
LIMIT 10;

-- Query 5: Average Deal VALUE by Position
SELECT
	p.position,
	COUNT(e.deal_id) AS de_signed,
	ROUND(AVG(e.deal_value_m), 2) AS avg_deal_value_m,
	ROUND(SUM(e.deal_value_m), 2) AS total_value_m
FROM endorsement_deals e
JOIN players p ON e.player_id = p.player_id
GROUP BY p.position
ORDER BY avg_deal_value_m DESC;

-- Query 6: Marketability Tier Analysis
SELECT
	CASE
		WHEN p.marketability_score >= 9.0 THEN 'Elite (9.0+)'
		WHEN p.marketability_score >= 7.5 THEN 'High (7.5-8.9)'
		WHEN p.marketability_score >= 6.0 THEN 'Mid (6.0-7.4)'
		ELSE 'Developing (Below 6.0)'
	END AS marketability_tier,
	COUNT(e.deal_id) AS total_deals,
	ROUND(AVG(e.deal_value_m), 2) AS avg_deal_value_m,
	ROUND(SUM(e.deal_value_m), 2) AS total_value_m
FROM endorsement_deals e
JOIN players p ON e.player_id = p.player_id
GROUP BY marketability_tier
ORDER BY avg_deal_value_m DESC;

-- Query 7: industry Portfolio Share
SELECT
	b.industry,
	ROUND(SUM(e.deal_value_m) * 100.0 /
		(SELECT SUM(deal_value_m) FROM endorsement_deals), 2) AS portfolio_share_pct
FROM endorsement_deals e
JOIN brands b ON e.brand_id = b.brand_id
GROUP BY b.industry
ORDER BY portfolio_share_pct DESC;

-- Query 8: Year Over Year Growth
SELECT
    deal_year,
    ROUND(SUM(deal_value_m), 2) AS total_value_m,
    LAG(ROUND(SUM(deal_value_m), 2)) OVER (ORDER BY deal_year) AS prev_year_value_m,
    ROUND(
        (SUM(deal_value_m) - LAG(SUM(deal_value_m)) OVER (ORDER BY deal_year)) * 100.0
        / LAG(SUM(deal_value_m)) OVER (ORDER BY deal_year),
    2) AS yoy_growth_pct
FROM endorsement_deals
GROUP BY deal_year
ORDER BY deal_year;

-- Query 9: Top Earner Per industry
SELECT industry, player_name, position, total_value_m
FROM (
    SELECT
        b.industry,
        p.player_name,
        p.position,
        ROUND(SUM(e.deal_value_m), 2) AS total_value_m,
        RANK() OVER (
            PARTITION BY b.industry
            ORDER BY SUM(e.deal_value_m) DESC
        ) AS industry_rank
    FROM endorsement_deals e
    JOIN players p ON e.player_id = p.player_id
    JOIN brands b ON e.brand_id = b.brand_id
    GROUP BY b.industry, p.player_name, p.position
)
WHERE industry_rank = 1
ORDER BY total_value_m DESC;

-- Query 10: Deal Performance by Deal Type
SELECT
    e.deal_type,
    ROUND(AVG(dp.brand_revenue_lift_pct), 2) AS avg_revenue_lift_pct,
    ROUND(AVG(dp.social_engagement_score), 2) AS avg_engagement_score,
    ROUND(AVG(dp.customer_recall_pct), 2) AS avg_recall_pct,
    ROUND(AVG(dp.nps_delta), 2) AS avg_nps_improvement
FROM deal_performance dp
JOIN endorsement_deals e ON dp.deal_id = e.deal_id
-- GROUP BY e.deal_type
ORDER BY avg_revenue_lift_pct DESC;

