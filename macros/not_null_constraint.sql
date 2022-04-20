-- Write a macro to validate not null constraint across columns in a model

{% macro not_null_constraint(model, columns) -%}

SELECT * FROM {{ model }}
WHERE
{% for entry in adapter.get_columns_in_relation(model) -%}
    {% if columns -%}
        {% if entry.column | lower in columns -%}
            {{ entry.column }} IS NULL OR
        {% endif %}
    {% else -%}
        {{ entry.column }} IS NULL OR
    {% endif %}
{% endfor %}
FALSE

{% endmacro %}
