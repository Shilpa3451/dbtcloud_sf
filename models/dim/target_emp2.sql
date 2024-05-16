with src_emp2 as(
    select * from {{ ref('stg_emp2') }}
)

select 
empid,kind,fullName,age,gender,areaCode,phoneNumber,timestamp_column from src_emp2