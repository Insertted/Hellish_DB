WITH gender_visits AS (
    SELECT 
        pz.name AS pizzeria_name,
        p.gender,
        COUNT(*) AS visit_count
    FROM person_visits pv
    JOIN person p ON p.id = pv.person_id
    JOIN pizzeria pz ON pz.id = pv.pizzeria_id
    GROUP BY pz.name, p.gender
),
max_gender_visits AS (
    SELECT 
        pizzeria_name,
        gender,
        visit_count,
        MAX(visit_count) OVER (PARTITION BY pizzeria_name) AS max_visits
    FROM gender_visits
)
SELECT DISTINCT pizzeria_name
FROM max_gender_visits
WHERE visit_count = max_visits
ORDER BY pizzeria_name;