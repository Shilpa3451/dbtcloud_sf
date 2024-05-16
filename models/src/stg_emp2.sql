with raw_data as (
    select * from airbnb.raw.raw_data2
)

select
f.value:empid::string as empid,
f.value:kind::string as kind,
f.value:fullName::string as fullName,
f.value:age::number as age,
f.value:gender::string as gender,
f.value:phoneNumber.areaCode::number as areaCode,
f.value:phoneNumber.number::number as phoneNumber,
CURRENT_TIMESTAMP AS timestamp_column

from raw_data as raw,
lateral flatten(input => raw.data_content:root) f
