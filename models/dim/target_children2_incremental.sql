{{
  config(
    materialized = 'incremental',
    on_schema_change='fail',
    unique_key = 'row_id'
    )
}}

with src_children2 as(
    select * from {{ ref('stg_children2') }}
)

select
{{ dbt_utils.generate_surrogate_key(['empid','name','age','gender']) }} 
as row_id,
 child.empid,child.name,child.age,child.gender,timestamp_column from src_children2 as child
 {% if is_incremental() %}
  WHERE timestamp_column > (select max(timestamp_column) from {{ this }})
{% endif %}