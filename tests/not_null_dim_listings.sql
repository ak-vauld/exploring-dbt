-- Generic tests to validate constaints across different models
{{ not_null_constraint(ref('dim_listings_cleansed'), [])}}
