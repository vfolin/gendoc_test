with

metadata_tables as (
    select
        LOWER(table_catalog) as table_catalog,
        LOWER(table_schema) as table_schema,
        LOWER(table_name) as table_name,
        row_count
    from {{ source('metadata', 'tables') }}
    where table_catalog = 'ANALYTICS' and table_schema = 'DBT_CORE_REUSABLE_DEMO' and table_type = 'BASE TABLE'
)

select * from metadata_tables