{{
  config(
    materialized = 'view',
    )
}}

with stg_hosts
as (
    select * 
    from {{ref ('stg__hosts')}}
)
select host_id, 
    NVL(host_name, 'Anonymous') as host_name,
    is_superhost,
    created_at,
    updated_at
from stg_hosts