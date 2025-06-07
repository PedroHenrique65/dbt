{{ 
    config(
        tags=['comercial']
    ) 
}}

WITH orders AS (
    SELECT
        order_id,
        customer_id,
        employee_id,
        order_date,
        required_date,
        shipped_date,
        ship_via,
        freight,
        ship_name,
        ship_address,
        ship_city,
        ship_region,
        ship_postal_code,
        ship_country,
        case 
            when shipped_date is null then 'envio pendente'
            else 'enviado'
        end as status_envio
    FROM {{ source('northwind', 'orders') }}

)

    SELECT * FROM orders