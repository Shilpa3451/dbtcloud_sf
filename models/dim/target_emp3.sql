with stg_raw_data3 as(
    select * from {{ ref('stg_raw_data3') }}
)

select raw_id,
empid,kind,fullName,age,gender,areaCode,phoneNumber,updated_date from stg_raw_data3