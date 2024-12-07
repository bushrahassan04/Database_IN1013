--1
SELECT DISTINCT b.cust_name
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management rm ON t.room_name = rm.room_name AND b.bill_date = rm.room_date
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE b.bill_total > 450.00 AND s.first_name = 'Charles';

--2
SELECT s.first_name, s.surname
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management rm ON t.room_name = rm.room_name AND b.bill_date = rm.room_date
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE b.cust_name = 'Nerida Smith' AND b.bill_date = 160111;

--3
SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = (SELECT MIN(bill_total) FROM restBill);

--4
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no NOT IN (SELECT DISTINCT b.waiter_no FROM restBill b);

--5
SELECT b.cust_name, hs.first_name AS headwaiter_first_name, hs.surname AS headwaiter_surname, rm.room_name
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management rm ON t.room_name = rm.room_name AND b.bill_date = rm.room_date
JOIN restStaff hs ON rm.headwaiter = hs.staff_no
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill);

