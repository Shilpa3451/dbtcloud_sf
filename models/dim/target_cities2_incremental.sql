{{
  config(
    materialized = 'incremental',
    on_schema_change='fail',
    unique_key = 'row_id'
    )
}}

with src_cities2 as (
    select * from {{ ref('stg_cities2') }}
)

select
{{ dbt_utils.generate_surrogate_key(['empid','place']) }} as row_id,
 cityy.empid,cityy.place,timestamp_column from src_cities2 as cityy
 {% if is_incremental() %}
  WHERE timestamp_column > (select max(timestamp_column) from {{ this }})
{% endif %}

