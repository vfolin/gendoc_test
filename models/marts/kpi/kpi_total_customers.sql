-- File: models/marts/kpi/kpi_total_customers.sql

with customers as (
    select * from {{ ref('dim_customer') }}
),

final as (
    select
        partition_date,
        count(distinct custkey) as total_customers
    from customers
    group by partition_date
)

select * from final