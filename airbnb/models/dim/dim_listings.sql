{{
  config(
    materialized = 'view',
    )
}}
with stg_listings
as (
    select  * 
    from {{ ref ('stg__listings')}}
)
select LISTING_ID,
    LISTING_NAME,
    ROOM_TYPE,
    case when MINIMUM_NIGHTS = 0 
        then 1 
        else MINIMUM_NIGHTS
    end as MINIMUM_NIGHTS,
    HOST_ID,
    replace(price_str,'$') :: number(10,2) as price,
    created_at,
    updated_at
from stg_listings