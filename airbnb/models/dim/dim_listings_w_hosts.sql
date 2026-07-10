
with 
lis AS(
    SELECT * FROM {{ ref('dim_listings_cleansed')}}
),
hos AS(
    SELECT * FROM {{ ref('dim_hosts_cleansed')}}
)

SELECT
  lis.listing_id,
  lis.listing_name,
  lis.room_type,
  lis.minimum_nights,
  lis.price,
  lis.host_id,
  hos.host_name,
  hos.is_superhost as host_is_superhost,
  lis.created_at,
  GREATEST(lis.updated_at, hos.updated_at) as updated_at
FROM lis
LEFT JOIN hos ON (hos.host_id = lis.host_id)