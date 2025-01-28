-- How many listings are in Lincoln Park?

-- +----------+
-- | 272      |
-- +----------+


SELECT COUNT(*) AS Lincoln_Park_listings
FROM listings
WHERE neighborhood = "Lincoln Park";

