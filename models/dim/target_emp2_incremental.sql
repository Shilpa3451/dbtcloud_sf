{{
  config(
    materialized = 'incremental',
    on_schema_change='fail',
    unique_key = 'row_id'
    )
}}

with src_emp2 as(
    select * from {{ ref('stg_emp2') }}
)

select 
{{ dbt_utils.generate_surrogate_key(['empid','kind','fullName']) }} as row_id,
empid,kind,fullName,age,gender,areaCode,phoneNumber,timestamp_column from src_emp2
{% if is_incremental() %}
  WHERE timestamp_column > (select max(timestamp_column) from {{ this }})
{% endif %}