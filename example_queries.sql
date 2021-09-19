SELECT firstname, lastname
FROM EMPLOYEE
WHERE EMPLOYEE.emp_id IN (
    SELECT emp_id, MAX(COUNT(delivereremp_id))
    FROM EMPLOYEE, SUPERVISES
    WHERE emp_id=manageremp_id 
    GROUP BY manageremp_id ;
);

SELECT AVG(SUM(ORDER_ID))
FROM  SILVER_MEMBER, CUSTOMER, CREATES
WHERE CUSTOMER.customer_id=SILVER_MEMBER.customer_id AND CREATES.customer_id=CUSTOMER_id
FROM CREATES.order_id;

SELECT firstname, lastname, restaurant_name
FROM RESTAURANT_TYPE, RESTAURANT, CUSTOMER, CREATES, ORDERTBL
WHERE CUSTOMER.customer_id=CREATES.customer_id AND CREATES.order_id=ORDERTBL.order_id
        AND RESTAURANT.restaurant_name=ORDERTBL.restaurant_name 
        AND restaurant_type.restaurant_name=ORDERTBL.restaurant_name
        AND restaurant_type.restraunt_type='Popular';
        
SELECT firstname, lastname
FROM CUSTOMER, SILVER_MEMBER, ISSUED, MEMBER_CARD
WHERE CUSTOMER.customer_id=SILVER_MEMBER.customer_id AND SILVER_MEMBER.mem_id=ISSUED.mem_id
        AND ISSUED.member_id=MEMBER_CARD.member_id 
        AND MEMBER_CARD.mem_date <= TRUNC(CUSTOMER.join_date) + 30;
