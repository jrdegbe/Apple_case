-- Generate and Insert Product Stock Records
INSERT INTO public.product_stock (prod_id, premise_id, stock)
SELECT
  p.prod_id,
  pr.premise_id,
  random() * 20000 + 1  -- Random stock value between 1 and 20000
FROM
  product p
  CROSS JOIN premise pr;