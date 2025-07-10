-- Merge rows from both tables (no join) using zip logic via ROW_NUMBER

WITH emp AS (
  SELECT *, ROW_NUMBER() OVER () AS rn FROM source_mysql.test_emp_dt
),
prod AS (
  SELECT *, ROW_NUMBER() OVER () AS rn FROM source_mysql.test_product_dt
)

SELECT
  emp.e_id,
  emp.name,
  emp.department,
  emp.salary,
  emp.join_date,
  prod.pd_id,
  prod.product_name,
  prod.category,
  prod.price,
  prod.stock_quantity
FROM emp
JOIN prod
ON emp.rn = prod.rn

