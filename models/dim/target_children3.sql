with stg_raw_data3 as(
    select * from {{ ref('stg_raw_data3') }}
)

select raw_id,
 child.empid,child.child_name,child.child_age,child.child_gender,updated_date from
  stg_raw_data3 as child
 