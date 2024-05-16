{{
    config(
        materialized = 'incremental',
        unique_key='empid',
        incremental_strategy='delete+insert',
        on_schema_change='fail'
) }}

WITH target_new_emp2 AS (
    SELECT * FROM {{ ref('target_new_emp2') }}
)
SELECT 
  *
FROM target_new_emp2
{% if is_incremental() %}
  where created_at > (select max(created_at) from {{ this }})
{% endif %}