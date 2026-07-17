with src_hosts AS(
    SELECT * FROM {{ ref('src_hosts')}}
)
SELECT 
    host_id,
    CASE WHEN host_name is null then 'Anonymous' ELSE host_name
    End as host_name,
    is_superhost,
    created_at,
    updated_at
from src_hosts