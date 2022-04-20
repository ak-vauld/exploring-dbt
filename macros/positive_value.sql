-- Generic test to validate columns with only positive values

{% test positive_value(model, column_name) %}

SELECT *
FROM {{ model }}
WHERE {{ column_name }} < 1

{% endtest %}
