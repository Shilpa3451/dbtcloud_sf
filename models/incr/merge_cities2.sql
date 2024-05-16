{{
    config(
        materialized = 'incremental',
        unique_key='cityid',
        incremental_strategy='merge',
        merge_update_columns = ['city_name'],
        on_schema_change='fail'
) }}
WITH target_new_cities2 AS (
    SELECT * FROM {{ ref('target_new_cities2') }}
)
SELECT 
  *
  FROM target_new_cities2
{% if is_incremental() %}
  where created_at > (select max(created_at) from {{ this }})
{% endif %}
