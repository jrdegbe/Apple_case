INSERT INTO public.order_details (order_id, prod_id, quantity, discount)
SELECT o.order_id, p.prod_id, od.quantity, od.discount
FROM (
    VALUES
        (1, 0.1),
        (2, 0.15),
        (2, 0.2),
        (2, 0.1),
        (3, 0.2),
        (1, 0.1),
        (1, 0.3),
        (4, 0.1),
        (1, 0.2),
        (1, 0.2),
        (2, 0.1),
        (4, 0.1),
        (2, 0),
        (3, 0.1),
        (1, 0.1),
        (2, 0.1),
        (1, 0.2),
        (3, 0.1),
        (1, 0.3),
        (1, 0.15),
        (2, 0),
        (6, 0.1),
        (2, 0.15),
        (1, 0.15),
        (1, 0.3),
        (1, 0.2),
        (4, 0.15),
        (3, 0),
        (2, 0.15),
        (3, 0.1),
        (1, 0.1),
        (1, 0),
        (1, 0.2),
        (1, 0.15),
        (2, 0.1),
        (2, 0),
        (1, 0.1),
        (1, 0.3),
        (1, 0.2),
        (4, 0.1),
        (2, 0),
        (3, 0),
        (2, 0.2),
        (1, 0.2),
        (1, 0.1),
        (1, 0.1),
        (1, 0.15),
        (3, 0.2),
        (1, 0),
        (2, 0.2)
) AS od (order_id, discount)
JOIN orders o ON o.order_id = od.order_id
JOIN product p ON p.prod_id = (
    CASE
        WHEN o.cust_id BETWEEN 50001 AND 50025 THEN od.order_id
        WHEN o.cust_id BETWEEN 50026 AND 50050 THEN od.order_id - 25
    END
);
