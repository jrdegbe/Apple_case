INSERT INTO public.order_details (order_id, prod_id, quantity, discount)
SELECT
    o.order_id,
    p.prod_id,
    CASE
        WHEN o.order_id BETWEEN 1 AND 20 THEN
            CASE
                WHEN p.prod_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15) THEN
                    CASE
                        WHEN o.order_id BETWEEN 1 AND 10 THEN
                            CASE
                                WHEN o.order_id % 2 = 0 THEN
                                    CASE
                                        WHEN p.prod_id IN (2, 6, 15) THEN 0
                                        ELSE 2
                                    END
                                ELSE
                                    CASE
                                        WHEN p.prod_id IN (2, 6, 15) THEN 1
                                        ELSE 3
                                    END
                            END
                        ELSE
                            CASE
                                WHEN p.prod_id IN (2, 6, 15) THEN 4
                                ELSE 5
                            END
                    END
                ELSE
                    CASE
                        WHEN o.order_id BETWEEN 1 AND 10 THEN
                            CASE
                                WHEN o.order_id % 2 = 0 THEN
                                    CASE
                                        WHEN p.prod_id IN (2, 6, 15) THEN 6
                                        ELSE 7
                                    END
                                ELSE
                                    CASE
                                        WHEN p.prod_id IN (2, 6, 15) THEN 8
                                        ELSE 9
                                    END
                            END
                        ELSE
                            CASE
                                WHEN p.prod_id IN (2, 6, 15) THEN 10
                                ELSE 11
                            END
                    END
            END
        ELSE
            CASE
                WHEN o.order_id BETWEEN 21 AND 47 THEN
                    CASE
                        WHEN p.prod_id IN (2, 6, 15) THEN
                            CASE
                                WHEN o.order_id % 2 = 0 THEN 12
                                ELSE 13
                            END
                        ELSE
                            CASE
                                WHEN o.order_id % 2 = 0 THEN
                                    CASE
                                        WHEN p.prod_id IN (1, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14) THEN 14
                                        ELSE 15
                                    END
                                ELSE
                                    CASE
                                        WHEN p.prod_id IN (1, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14) THEN 16
                                        ELSE 17
                                    END
                            END
                    END
                ELSE
                    CASE
                        WHEN o.order_id % 2 = 0 THEN
                            CASE
                                WHEN p.prod_id IN (1, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14) THEN 18
                                ELSE 19
                            END
                        ELSE
                            CASE
                                WHEN p.prod_id IN (1, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14) THEN 20
                                ELSE 21
                            END
                    END
            END
    END AS quantity,
    CASE
        WHEN o.order_id BETWEEN 1 AND 20 THEN
            CASE
                WHEN o.order_id % 2 = 0 THEN
                    CASE
                        WHEN p.prod_id IN (2, 6, 15) THEN 0.0
                        ELSE 0.1
                    END
                ELSE
                    CASE
                        WHEN p.prod_id IN (2, 6, 15) THEN 0.15
                        ELSE 0.2
                    END
            END
        ELSE
            CASE
                WHEN o.order_id BETWEEN 21 AND 47 THEN
                    CASE
                        WHEN p.prod_id IN (2, 6, 15) THEN
                            CASE
                                WHEN o.order_id % 2 = 0 THEN 0.0
                                ELSE 0.1
                            END
                        ELSE
                            CASE
                                WHEN o.order_id % 2 = 0 THEN
                                    CASE
                                        WHEN p.prod_id IN (1, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14) THEN 0.15
                                        ELSE 0.2
                                    END
                                ELSE
                                    CASE
                                        WHEN p.prod_id IN (1, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14) THEN 0.3
                                        ELSE 0.1
                                    END
                            END
                    END
                ELSE
                    CASE
                        WHEN o.order_id % 2 = 0 THEN
                            CASE
                                WHEN p.prod_id IN (1, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14) THEN 0.2
                                ELSE 0.15
                            END
                        ELSE
                            CASE
                                WHEN p.prod_id IN (1, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14) THEN 0.1
                                ELSE 0.3
                            END
                    END
            END
    END AS discount
FROM
    orders o
JOIN
    product p
ON
    o.order_id % 20 + 1 = p.prod_id;
