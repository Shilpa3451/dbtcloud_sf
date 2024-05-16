with stg_raw_data3 as (
    select * from {{ ref('stg_raw_data3') }}
)

select raw_id,
cityyy.empid,cityyy.year,updated_date from stg_raw_data3 as cityyy

