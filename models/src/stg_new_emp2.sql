WITH stg_new_emp2 AS (
    SELECT * FROM {{ ref('src_new_emp2') }}
)
SELECT 
    *
FROM stg_new_emp2