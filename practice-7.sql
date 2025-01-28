-- What is the number of reviews and date of the latest review, by property type?

-- +-------------------------------------+----------+----------------------------+
-- | Boat                                | 2        | 2021-06-19                 |
-- | Entire bungalow                     | 424      | 2021-10-18                 |
-- | Entire condominium (condo)          | 26518    | 2021-10-18                 |
-- | Entire cottage                      | 129      | 2021-10-12                 |
-- | Entire guest suite                  | 11176    | 2021-10-18                 |
-- | Entire guesthouse                   | 3577     | 2021-10-18                 |
-- | Entire home/apt                     | 21       | 2019-10-19                 |
-- | Entire loft                         | 8416     | 2021-10-17                 |
-- | Entire place                        | 10       | 2019-03-31                 |
-- | Entire rental unit                  | 149681   | 2021-10-18                 |
-- | Entire residential home             | 13889    | 2021-10-18                 |
-- | Entire serviced apartment           | 1271     | 2021-10-17                 |
-- | Entire townhouse                    | 3588     | 2021-10-17                 |
-- | Entire villa                        | 75       | 2021-10-12                 |


SELECT listings.property_type, COUNT(reviews.id) AS reviews, MAX(reviews.date_reviewed) AS latest_review
FROM listings
INNER JOIN reviews ON listings.id = reviews.listing_id
GROUP BY listings.property_type;


-- I spent so long on the below method before realizing all I needed was a MAX function
SELECT listings.property_type, COUNT(reviews.id) AS reviews, MAX(reviews.date_reviewed) AS latest_review
FROM (
    SELECT reviews.id, listings.property_type, reviews.date_reviewed
    FROM listings
    INNER JOIN reviews ON listings.id = reviews.listing_id
    ORDER BY reviews.date_reviewed DESC
) AS reviews_by_newest
INNER JOIN reviews ON reviews_by_newest.id = reviews.id
INNER JOIN listings ON reviews.listing_id = listings.id
GROUP BY listings.property_type;
