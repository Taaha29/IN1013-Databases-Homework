--1
SELECT 
	c.name
FROM 
	Customers c
JOIN 
	Bills b 
ON 
	s.customer_id = b.customer_id
JOIN 
	Headwaiters h 
ON 
	b.headwaiter_id = h.headwaiter_id
WHERE b.total_amount > 450.00
  AND h.name = 'Charles';

--2
SELECT 
	h.name, h.surname
FROM 
	Customers c
JOIN 
	Bills b 
ON 
	c.customer_id = b.customer_id
JOIN 
	Headwaiters h 
ON 
	b.headwaiter_id = h.headwaiter_id
WHERE c.name = 'Nerida'
  AND b.bill_date = '2016-01-11';

--3
SELECT 
	c.name
FROM 
	Customers c
JOIN 
	Bills b 
ON 
	c.customer_id = b.customer_id
WHERE b.total_amount = (
    SELECT MIN(total_amount)
    FROM Bills
);

--4
SELECT 
	w.name
FROM 
	Waiters w
LEFT JOIN 
	Bills b 
ON 
	w.waiter_id = b.waiter_id
WHERE 
	b.bill_id IS NULL;

--5
SELECT
	c.name AS customer_name, 
	h.name AS headwaiter_name, 
	h.surname AS headwaiter_surname, 
	r.room_name
FROM 
	Customers c
JOIN 
	Bills b 
ON 
	c.customer_id = b.customer_id
JOIN 
	Headwaiters h 
ON 
	b.headwaiter_id = h.headwaiter_id
JOIN 
	Rooms r 
ON 
	b.room_id = r.room_id
WHERE b.total_amount = (
    SELECT MAX(total_amount)
    FROM Bills
);
