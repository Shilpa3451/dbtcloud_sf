{{
    config(
        materialized = 'incremental',
        unique_key='childid',
        incremental_strategy='append',
        on_schema_change='fail'
) }}
WITH target_new_children2 AS (
    SELECT * FROM {{ ref('target_new_children2') }}
)
SELECT 
  *
  FROM target_new_children2
{% if is_incremental() %}
  where created_at > (select max(created_at) from {{ this }})
{% endif %}