with raw_data as(
    select * from airbnb.raw.raw_data2
)

select
f.value:empid::string as empid,
city.value:place::string as place,
years.value::string as yearsLived,
CURRENT_TIMESTAMP AS timestamp_column

from raw_data as raw,
lateral flatten(input => raw.data_content:root) f,
lateral flatten(input => f.value:citiesLived, outer=>true) city,
lateral flatten(input => city.value:yearsLived, outer=>true) years