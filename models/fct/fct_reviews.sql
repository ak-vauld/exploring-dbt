-- Specify model level configuration using Jinja template and dbt config method.
{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

WITH

raw_reviews AS (
    select * FROM {{ ref('raw_reviews') }}
)

SELECT
    {{ dbt_utils.surrogate_key(['listing_id', 'review_date', 'review_text'])}} as review_id,
    *
FROM raw_reviews
WHERE
    review_text IS NOT NULL
    {% if is_incremental() %} -- Tell dbt how to increment the data
        AND review_date > (
            SELECT MAX(review_date) FROM {{this}}
        )
    {% endif %}
