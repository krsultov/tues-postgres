-- Question 1: everything in a given room, grouped by kind.
-- Returns inventory number, kind, model and purchase date for one room, with
-- devices of the same kind next to each other. Change the room name to see
-- another room. There is no GROUP BY because every device must stay its own
-- row; "grouped" here means sorted by kind.
SELECT d.inventory_number,
       k.name AS kind,
       d.model,
       d.purchase_date
FROM devices d
JOIN kinds k ON k.id = d.kind_id
JOIN rooms r ON r.id = d.room_id
WHERE r.name = 'Computer Lab 41'
ORDER BY k.name, d.inventory_number;

-- Question 2: equipment older than 5 years, with its exact age, oldest first.
-- Returns inventory number, kind, model, room, purchase date and age in years,
-- months and days. The age is calculated from today, so it is never out of
-- date. LEFT JOIN keeps devices in storage (room_id is NULL), which a plain
-- JOIN would silently drop.
SELECT d.inventory_number,
       k.name AS kind,
       d.model,
       COALESCE(r.name, 'in storage') AS room,
       d.purchase_date,
       age(CURRENT_DATE, d.purchase_date) AS age
FROM devices d
JOIN kinds k ON k.id = d.kind_id
LEFT JOIN rooms r ON r.id = d.room_id
WHERE d.purchase_date < CURRENT_DATE - INTERVAL '5 years'
ORDER BY d.purchase_date, d.inventory_number;
