with stg_raw_data3 as (
    select * from {{ ref('stg_raw_data3') }}
)

select raw_id,
 cityy.empid,cityy.city_name,updated_date from stg_raw_data3 as cityy

