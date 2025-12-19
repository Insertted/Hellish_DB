SELECT 
    m1.pizza_name,
    pz1.name AS pizzeria_name_1,
    pz2.name AS pizzeria_name_2,
    m1.price
FROM menu m1, menu m2, pizzeria pz1, pizzeria pz2
WHERE m1.pizza_name = m2.pizza_name
  AND m1.price = m2.price
  AND m1.pizzeria_id != m2.pizzeria_id
  AND pz1.id = m1.pizzeria_id
  AND pz2.id = m2.pizzeria_id
  AND pz1.name < pz2.name
ORDER BY m1.pizza_name;