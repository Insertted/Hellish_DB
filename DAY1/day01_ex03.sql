SELECT DISTINCT
    po.order_date AS action_date,
    po.person_id
FROM person_order po
INNER JOIN person_visits pv 
    ON po.person_id = pv.person_id 
    AND po.order_date = pv.visit_date
ORDER BY action_date ASC, person_id DESC;