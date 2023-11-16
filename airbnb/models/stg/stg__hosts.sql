WITH source AS (
        SELECT *

        FROM {{ source('raw', 'raw_hosts') }}
)

SELECT
        ID AS HOST_ID,
        NAME AS HOST_NAME,
        IS_SUPERHOST,
        CREATED_AT,
        UPDATED_AT

FROM source