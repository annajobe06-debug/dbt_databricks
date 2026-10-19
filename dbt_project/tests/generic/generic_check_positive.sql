
{% test generic_check_positive (model, column_name) %}  -- Macros - function



SELECT 
    *
FROM 
   {{ model }}
WHERE 
    {{ column_name }} < 0

{% endtest %}

