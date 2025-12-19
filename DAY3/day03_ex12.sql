INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
    (SELECT MAX(id) FROM person_order) + gs.n,
    p.id,
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25'
FROM person p
CROSS JOIN generate_series(1, (SELECT COUNT(*) FROM person)) AS gs(n)
WHERE gs.n = p.id - (SELECT MIN(id) FROM person) + 1;