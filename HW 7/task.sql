--1

CREATE VIEW samsBills AS
SELECT first_name, surname, bill_date, cust_name, bill_total
FROM restStaff
INNER JOIN restBill
ON restStaff.staff_no = restBill.waiter_no
WHERE first_name = "Sam" AND surname = "Pitt";

SELECT * FROM samsBills;

--2
SELECT * FROM samsBills
WHERE bill_total > 400;

--3
CREATE VIEW roomTotals AS
SELECT room_name, COUNT(restBill.table_no) AS "total_sum"
FROM restRest_table
INNER JOIN restBill
ON restRest_table.table_no = restBill.table_no
GROUP BY room_name;

SELECT * FROM roomTotals;

--4
CREATE VIEW teamTotals
AS SELECT CONCAT(first_name, ' ', surname) AS headwaiter_name , SUM(restBill.bill_total) AS total_sum
FROM restBill
INNER JOIN restStaff W ON restBill.waiter_no = W.staff_no
JOIN restStaff Sl on w.headwaiter = Sl.staff_no
WHERE H.headwaiter IS NULL
GROUP BY Sl.staff_no;

SELECT * FROM teamTotals;
