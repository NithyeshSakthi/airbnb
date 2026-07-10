with source as (
        select * from {{ source('airbnb', 'listings') }}
  ),
  renamed as (
      select
          {{ adapter.quote("ID") }},
        {{ adapter.quote("LISTING_URL") }},
        {{ adapter.quote("NAME") }},
        {{ adapter.quote("ROOM_TYPE") }},
        {{ adapter.quote("MINIMUM_NIGHTS") }},
        {{ adapter.quote("HOST_ID") }},
        {{ adapter.quote("PRICE") }},
        {{ adapter.quote("CREATED_AT") }},
        {{ adapter.quote("UPDATED_AT") }}

      from source
  )
  select * from renamed
    