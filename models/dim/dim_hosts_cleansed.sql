-- Specify model level configuration using Jinja template and dbt config method.
{{
    config(
        materialized = 'view'
    )
}}

WITH raw_hosts AS (
    SELECT * FROM {{ref('raw_hosts')}}
)

SELECT
    host_id,
    NVL(host_name, 'Anonymous') AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM raw_hosts
