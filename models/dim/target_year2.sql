with src_cities as (
    select * from {{ ref('stg_cities2') }}
)

select 
cityyy.empid,cityyy.yearsLived,timestamp_column from src_cities as cityyy

