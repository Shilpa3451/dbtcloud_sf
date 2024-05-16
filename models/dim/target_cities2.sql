with src_cities2 as (
    select * from {{ ref('stg_cities2') }}
)

select
 cityy.empid,cityy.place,timestamp_column from src_cities2 as cityy

