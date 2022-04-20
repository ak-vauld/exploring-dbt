{% snapshot scd_raw_listings %}

-- Snapshot configuration for the raw_listings table
{{
    config(
        target_schema='DEV',
        unique_key='id',
        strategy='timestamp',
        updated_at='updated_at',
        invalidate_hard_deletes=True
    )
}}

-- invalidate_hard_deletes=True -> To detect deleted records

SELECT * FROM {{ source('airbnb', 'listings') }}

{% endsnapshot %}
