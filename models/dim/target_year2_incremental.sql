{{
  config(
    materialized = 'incremental',
    on_schema_change='fail',
    unique_key = 'row_id'
    )
}}

with src_cities as (
    select * from {{ ref('stg_cities2') }}
)

select 
{{ dbt_utils.generate_surrogate_key(['empid','yearsLived']) }} as row_id,
cityyy.empid,cityyy.yearsLived,timestamp_column from src_cities as cityyy
{% if is_incremental() %}
  WHERE timestamp_column > (select max(timestamp_column) from {{ this }})
{% endif %}

