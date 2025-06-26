with sales as (
    select * from {{ ref('fct_sales') }}
),

final as (
    select
        partition_date,
        sum(total_amount) / nullif(count(distinct order_id), 0) as avg_order_value
    from sales
    group by partition_date
)

select * from final

