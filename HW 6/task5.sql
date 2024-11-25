--1;
SELECT 
    s.first_name, 
    s.surname, 
    b.bill_date, 
    COUNT(b.bill_no) AS bill_count
FROM 
    restStaff s
JOIN 
    restBill b 
ON 
    s.staff_no = b.waiter_no
GROUP BY 
    s.first_name, s.surname, b.bill_date
HAVING 
    COUNT(b.bill_no) >= 2;

--2
SELECT 
    room_name, 
    COUNT(table_no) AS table_count
FROM 
    restRest_table
WHERE 
    no_of_seats > 6
GROUP BY 
    room_name;

--3
SELECT 
    r.room_name, 
    SUM(b.bill_total) AS total_bills
FROM 
    restBill b
JOIN 
    restRest_table r
ON 
    b.table_no = r.table_no
GROUP BY 
    r.room_name;

--4
SELECT 
    h.first_name AS headwaiter_first_name, 
    h.surname AS headwaiter_surname, 
    SUM(b.bill_total) AS total_bill_amount
FROM 
    restStaff w
JOIN 
    restStaff h
ON 
    w.headwaiter = h.staff_no
JOIN 
    restBill b
ON 
    w.staff_no = b.waiter_no
GROUP BY 
    h.first_name, h.surname
ORDER BY 
    total_bill_amount DESC;

--5
SELECT 
	c.name 
	AS customer_name
FROM 
	Customers c
JOIN 
	Bills b 
ON 
	c.customer_id = b.customer_id
GROUP BY 
	c.name
HAVING 
	AVG(b.total_amount) > 400.00;

--6
SELECT 
	w.name AS waiter_name, 
	w.surname AS waiter_surname, 
	b.bill_date, 
	COUNT(b.bill_id) AS num_bills
FROM 
	Waiters w
JOIN 
	Bills b 
ON 
	w.waiter_id = b.waiter_id
GROUP BY 
	w.name, w.surname, b.bill_date
HAVING 
	COUNT(b.bill_id) >= 3;
