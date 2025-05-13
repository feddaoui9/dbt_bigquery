{% macro price_after_discount(column_1, column_2) %}
({{ column_1 }} - {{ column_2 }})
{% endmacro %}
