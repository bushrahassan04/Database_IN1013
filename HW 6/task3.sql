--1
SELECT DISTINCT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.cust_name = 'Tanya Singh';

--2
SELECT room_date
FROM restRoom_management r
JOIN restStaff s ON r.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND r.room_name = 'Green' AND room_date BETWEEN 160201 AND 160229;

--3
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (SELECT headwaiter FROM restStaff WHERE first_name = 'Zoe' AND surname = 'Ball');

--4
SELECT b.cust_name, b.bill_total, s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

--5
SELECT DISTINCT s.first_name, s.surname
FROM restBill b1
JOIN restBill b2 ON b1.table_no = b2.table_no
JOIN restStaff s ON b1.waiter_no = s.staff_no
WHERE b1.bill_no IN (00014, 00017) OR b2.bill_no IN (00014, 00017);

--6
SELECT DISTINCT s.first_name, s.surname
FROM restRoom_management r
JOIN restStaff s ON r.headwaiter = s.staff_no OR s.staff_no IN (
    SELECT waiter_no 
    FROM restBill 
    WHERE table_no IN (
        SELECT table_no
        FROM restRest_table
        WHERE room_name = 'Blue'
    ) AND bill_date = 160312
)
WHERE r.room_name = 'Blue' AND r.room_date = 160312;
