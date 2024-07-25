{% macro get_region_by_country(country) %}
    {% set region_query %}
        {% if country == 'US' %}
            SELECT 'North America' as region
        {% else %}
            SELECT 'Unknown' as region
        {% endif %}
    {% endset %}
    {{ log("Region: " ~ region_query) }}
    {{ region_query }}
    
{% endmacro %}
