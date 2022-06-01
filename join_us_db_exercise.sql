SELECT COUNT(*) AS total_users, 
CASE 
    WHEN email LIKE '%gmail.com%' THEN 'gmail' 
    WHEN  email LIKE  '%yahoo.com%' THEN 'yahoo' 
    WHEN email LIKE '%hotmail.com%' THEN 'hotmail' 
    ELSE 'other' 
    END AS provider 
    FROM users
    GROUP BY provider
    ORDER BY total_users;
