-- Total transaction volume processed by Venmo this year
SELECT SUM(amount) AS total_transaction_volume
FROM Transaction
WHERE YEAR(timestamp) = YEAR(CURDATE());
-- Number of users who created accounts in the last month
SELECT COUNT(*) AS new_users_last_month
FROM User
WHERE registration_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);
-- Users with the highest number of sent payments
SELECT u.user_id, u.first_name, u.last_name, COUNT(t.transaction_id) AS sent_count
FROM User u
JOIN Transaction t ON u.user_id = t.sender_user_id
GROUP BY u.user_id
ORDER BY sent_count DESC
LIMIT 10;
-- Users who receive the most payments
SELECT u.user_id, u.first_name, u.last_name, COUNT(t.transaction_id) AS received_count
FROM User u
JOIN Transaction t ON u.user_id = t.recipient_user_id
GROUP BY u.user_id
ORDER BY received_count DESC
LIMIT 10;
-- Average transaction amount across all users
SELECT round(AVG(amount),2) AS average_transaction_amount
FROM Transaction;
-- Most frequently used funding source
SELECT method_type, COUNT(*) AS usage_count
FROM Payment_Method
JOIN User ON User.user_id = Payment_Method.payment_method_id
GROUP BY method_type
ORDER BY usage_count DESC
LIMIT 1;
-- Percentage of users verified with KYC procedures
SELECT 
  ROUND(SUM(CASE WHEN is_verified = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS percent_verified
FROM Payment_Method;
-- Users with the highest Venmo balance
SELECT u.user_id, u.first_name, u.last_name, ub.balance_amount
FROM User u
JOIN User_Balance_Entry as ub ON u.user_id = ub.user_id
ORDER BY ub.balance_amount DESC
LIMIT 10;

-- How often users transfer funds to bank accounts
SELECT 
    t.sender_user_id,
    COUNT(*) AS bank_transfer_count
FROM 
    transaction t
JOIN 
    payment_method pm ON t.recipient_user_id = pm.user_id
JOIN 
    bank_account ba ON pm.payment_method_id = ba.payment_method_id
GROUP BY 
    t.sender_user_id
ORDER BY 
    bank_transfer_count DESC;
-- Users who canceled the most payment requests
SELECT u.user_id, u.first_name, COUNT(*) AS canceled_requests
FROM Transaction t
JOIN User u ON t.sender_user_id = u.user_id
WHERE t.transaction_status = 'Cancelled'
GROUP BY u.user_id
ORDER BY canceled_requests DESC
LIMIT 10;
-- Users with the most friends
SELECT u.user_id, u.first_name, COUNT(*) AS friend_count
FROM User u
JOIN Friendship f ON u.user_id = f.user_id_1 OR u.user_id = f.user_id_2
GROUP BY u.user_id
ORDER BY friend_count DESC
LIMIT 10;
-- Most common privacy setting for transactions
SELECT privacy_setting, COUNT(*) AS count
FROM Transaction
GROUP BY privacy_setting
ORDER BY count DESC
LIMIT 1;
-- Days/times with the highest number of transactions
SELECT DATE(timestamp) AS date, COUNT(*) AS txn_count
FROM Transaction
GROUP BY date 
ORDER BY txn_count DESC
LIMIT 10;
-- States or regions with highest user density
SELECT state, COUNT(*) AS user_count
FROM User_Address
GROUP BY state
ORDER BY user_count DESC
LIMIT 10;
-- Flagged transactions reviewed by compliance this quarter
SELECT COUNT(*) AS flagged_this_quarter
FROM Dispute
WHERE QUARTER(created_timestamp) = QUARTER(CURDATE())
  AND YEAR(created_timestamp) = YEAR(CURDATE()); 
-- Which flagged transactions were confirmed as under review
SELECT *
FROM Dispute
WHERE dispute_status = 'Under review';
-- Users with the most reported or restricted accounts
SELECT u.user_id, u.first_name, COUNT(d.dispute_id) AS dispute_count
FROM User u
JOIN Transaction t ON u.user_id = t.sender_user_id OR u.user_id = t.recipient_user_id
JOIN Dispute d ON t.transaction_id = d.dispute_id
GROUP BY u.user_id
ORDER BY dispute_count DESC
LIMIT 10;
-- Average response time to complete a payment request
SELECT AVG(TIMESTAMPDIFF(DAY, created_timestamp, resolved_timestamp)) AS avg_response_time_days
FROM Dispute
WHERE resolved_timestamp IS NOT NULL;

-- What is the average number of transactions per business per month?
SELECT 
  AVG(txn_count) AS avg_txns_per_business_per_month
FROM (
  SELECT 
    bp.user_id, 
    COUNT(t.transaction_id) / COUNT(DISTINCT MONTH(t.timestamp)) AS txn_count
  FROM Business_Profile bp
  JOIN Transaction t ON bp.user_id = t.recipient_user_id
  GROUP BY bp.user_id
) AS monthly_txn_stats;


-- Average number of payments a user makes per month
SELECT AVG(monthly_count) AS avg_payments_per_user
FROM (
  SELECT sender_user_id, COUNT(*) / COUNT(DISTINCT MONTH(timestamp)) AS monthly_count
  FROM Transaction
  GROUP BY sender_user_id
) AS user_monthly_avg;
-- Peer-to-peer vs business transactions
SELECT 
  SUM(CASE WHEN bp.user_id IS NULL THEN 1 ELSE 0 END) AS peer_to_peer,
  SUM(CASE WHEN bp.user_id IS NOT NULL THEN 1 ELSE 0 END) AS business_related
FROM Transaction t
LEFT JOIN Business_Profile bp ON t.recipient_user_id = bp.user_id;





-- How many user have a business profile?
SELECT COUNT(DISTINCT user_id) AS total_users_with_business_profile
FROM Business_Profile;

