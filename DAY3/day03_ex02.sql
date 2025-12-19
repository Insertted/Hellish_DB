SELECT 
    m.pizza_name,
    m.price,
    pz.name AS pizzeria_name
FROM pizzeria pz
JOIN menu m ON m.pizzeria_id = pz.id
LEFT JOIN person_order po ON po.menu_id = m.id
WHERE po.id IS NULL
ORDER BY m.pizza_name, m.price;