# Write your MySQL query statement below
WITH 
counts AS 
(
    SELECT C.customer_id, C.customer_name, COUNT(T.contact_name) AS contacts_cnt, COUNT(D.email) AS trusted_contacts_cnt
    FROM Customers C LEFT JOIN Contacts T 
    ON C.customer_id = T.user_id
    LEFT JOIN Customers D 
    ON T.contact_name = D.customer_name AND T.contact_email = D.email
    GROUP BY C.customer_id
)

SELECT I.invoice_id, C.customer_name, I.price, C.contacts_cnt, C.trusted_contacts_cnt
FROM Invoices I INNER JOIN counts C 
ON I.user_id = C.customer_id 
GROUP BY I.invoice_id
ORDER BY I.invoice_id;

