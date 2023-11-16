with fct_reviews
as
(
    select * 
    from {{ ref('fct_reviews') }}
)
select review_sentiment, 
        count(*) as count_review_sentiment
from fct_reviews
group by review_sentiment