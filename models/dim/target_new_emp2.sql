{{
    config(
        materialized = 'incremental',
        unique_key='empid',
        on_schema_change='fail'
) }}

WITH stg_new_emp2 AS (
    SELECT * FROM {{ ref('stg_new_emp2') }}
)
SELECT 
  empid,
  kind,
  fullName,
  age,
  gender,
  areaCode,
  phoneNumber,
  created_at
FROM stg_new_emp2
GROUP BY empid, kind, fullName, age, gender, areaCode, phoneNumber, created_at
{% if is_incremental() %}
  having created_at > (select max(created_at) from {{ this }})
{% endif %}
