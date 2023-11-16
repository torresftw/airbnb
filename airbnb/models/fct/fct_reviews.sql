{#
    with stg_reviews as (
    select * 
    from {{ ref("stg__reviews")}}
)
select *
from stg_reviews
where review_comment is not null
#}

{{
    config(
        materialized ='incremental',
        on_schema_change='fail'
    )
}}

with stg_reviews as (
    select * 
    from {{ ref("stg__reviews")}}
)
select {{ dbt_utils.generate_surrogate_key(['listing_id','review_date','reviewer_name','review_comment'])}} as review_id,
        *
from stg_reviews
where review_comment is not null
{% if is_incremental() %}
    AND review_date > (select max(review_date) from {{this}})
{% endif %}

-- here {{ this }} refers to the the table itself i.e. fct_reviews