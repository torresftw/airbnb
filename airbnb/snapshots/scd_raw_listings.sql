{% snapshot scd_raw_listings %}

{{
   config(
       target_database='airbnb',
       target_schema='dev',
       unique_key='id',

       strategy='timestamp',
       updated_at='updated_at'
   )
}}

select * 
from  {{ source('airbnb', 'listings') }}


{% endsnapshot %}