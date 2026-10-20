WITH returns AS
(
    SELECT
        store_sk,
        product_sk,
        returned_qty,
        return_reason,
        refund_amount
    FROM {{ ref('bronze_returns') }}
),

store AS 
(
    SELECT
        store_sk,
        store_name
    FROM {{ ref('bronze_store') }}
),

product AS
(
    SELECT
        product_sk,
        product_name,
        category
    FROM {{ ref('bronze_product') }}
),

joined_query 
( 
    SELECT
        p.product_name,
        p.category,
        s.store_name,
        r.return_reason,
        r.returned_qty,
        r.refund_amount
    FROM returns r
    JOIN store s
    JOIN product p
)

SELECT 
    Product_name,
    category,
    store_name,
    return_reason,
    SUM(returned_qty) total_returned_qty,
    SUM(refund_amount) total_refund_amount
FROM joined_query
GROUP BY product_name, category, store_name, return_reason
ORDER BY total_refund_amount DESC
