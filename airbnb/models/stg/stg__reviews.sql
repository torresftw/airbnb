WITH source AS (
        SELECT *

        FROM {{ source('raw', 'raw_reviews') }}
)

SELECT
        LISTING_ID,
        DATE AS REVIEW_DATE,
        REVIEWER_NAME,
        COMMENTS AS REVIEW_COMMENT,
        SENTIMENT AS REVIEW_SENTIMENT

FROM source