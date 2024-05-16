with src_children2 as(
    select * from {{ ref('stg_children2') }}
)

select
 child.empid,child.name,child.age,child.gender,timestamp_column from src_children2 as child
 