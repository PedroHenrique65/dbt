{{ 
    config(
        tags=['comercial']
    ) 
}}

with orders as (
    SELECT
        EXTRACT(MONTH FROM order_date) AS mes,
        EXTRACT(YEAR FROM order_date) AS ano,
        freight AS total_frete
    FROM {{ref('stg_orders')}}
),
vendas as (
    SELECT
        mes,
        ano,
        SUM(total_frete) AS total_frete,
    FROM
        orders
    GROUP BY
        mes, ano
)

SELECT
    *
FROM vendas