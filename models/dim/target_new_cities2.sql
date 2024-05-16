{{
    config(
        materialized = 'incremental',
        unique_key='cityid',
        on_schema_change='fail'
) }}
WITH stg_new_emp2 AS (
    SELECT * FROM {{ ref('stg_new_emp2') }}
)
SELECT 
  {{ dbt_utils.generate_surrogate_key(['empid', 'city_name','created_at']) }} AS cityid,
  empid,
  city_name,
  created_at
  FROM stg_new_emp2
GROUP BY empid, city_name, created_at
{% if is_incremental() %}
  having created_at > (select max(created_at) from {{ this }})
{% endif %}
