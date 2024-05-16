with src_raw_data as (
    select * from {{ ref('src_raw_data') }}
)

select 
raw_id,
empid,
name,
gender,
age
from 
src_raw_data