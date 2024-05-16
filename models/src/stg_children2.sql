with raw_data as (
    select * from airbnb.raw.raw_data2
)

select 
f.value:empid::string as empid,
c.value:name::string as name,
c.value:age::number as age,
c.value:gender::string as gender,
CURRENT_TIMESTAMP AS timestamp_column

from raw_data as raw,
lateral flatten(input => raw.data_content:root) f,
lateral flatten(input => f.value:children, outer=>true) c

