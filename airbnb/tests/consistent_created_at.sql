SELECT 
    fct.listing_id,
    fct.review_date,
    lis.created_at
FROM {{ ref('fct_reviews')}} fct
JOIN {{ ref('dim_listings_cleansed')}} lis
    ON fct.listing_id = lis.listing_id
WHERE fct.review_date < lis.created_at
