# Final Project Report: Venmo

#### ShyAnn Ball

#### Abbas Naqvi

#### Meimei Peterson

#### Haley Young

#### IS 4420 Summer 2025


## Table of Contents

**Table of Contents 1**

**Team Introduction 1**

**Executive Summary 1**
Account Creation & Authentication: 2
Transaction Management: 2
Account & Balance Features: 2
Friends & Social Features: 3
Administrative & Security Access: 3

**Business Rules 3
Data Outputs/Business Questions 5**

**Entity Relationship Diagrams 6
Database Implementation 9**

**Answer Business Questions 10**

**Summary & Conclusion 19**
Project Component Summary: 19
Why Sponsor this Project: 19

**References and Appendix 19**

### Team Introduction

I am ShyAnn Ball, an Operations and Supply Chain major. I am the Vice President of Alpha Phi
sorority at the University. I work at a golf course in Park City and love it immensely.

I am Abbas Naqvi, an Information systems major. I currently work for the ITS field services for
University of Utah Hospital. I am passionate about working in the healthcare industry.

I am Meimei Peterson, an Operations and Supply Chain major at the U with minors in
Accounting & Entrepreneurship. I currently intern at a reproductive health startup focusing on
good manufacturing practices for pre-clinical operations.

I am Haley Young, a Computer Science major at the U with minors in physics and Information
Systems. I am currently interning with Fight Against Domestic Violence and I am interested in
learning more about network architecture.

## Executive Summary

This project involves the development of a relational database designed to support the core
operations of Venmo, a peer-to-peer mobile payment service owned by PayPal. Venmo allows
users to send and receive money digitally, connect their bank accounts or debit cards, and engage
with a social feed that displays transaction activity among friends.

Venmo’s business model is built around facilitating digital financial transactions while promoting
user engagement through social interaction. Although the platform is free to use for most P2P


transfers, Venmo generates revenue through instant transfer fees, merchant transaction fees when
users pay businesses using Venmo, and fees for premium services such as Venmo debit cards.
The company’s goal is to simplify money movement while mixing financial activity within a
social and mobile-first user experience.

To support these operational goals, we designed and implemented a prototype of Venmo’s
back-end relational database system. This system supports essential business functions including
transaction logging, account balance tracking, user data management, and feed visibility.
The database was populated with sample data generated using Mockaroo, and we ran SQL
queries to simulate business analysis functions such as identifying the number of total
transactions, tracking new user growth, and ranking the most active users. This project
demonstrates how structured data systems can support data-driven decision-making and efficient
platform operations.

### User Requirements

Account Creation & Authentication:

1. As a new user, I want to create an account using my email, phone number, and a secure
    password so that I can start using Venmo.
2. As a user, I want to securely log in and log out of my account to protect my data and
    prevent unauthorized access.
3. As a user, I want to verify my identity via email or phone to comply with KYC (Know
    Your Customer) regulations.
4. As a user, I want to update my personal details (name, phone, photo) so I can keep my
    profile current.
5. As a system administrator, I want to record when accounts are created and verified to
    ensure compliance and auditability.

Transaction Management:

6. As a user, I want to send money by entering another user’s username, the amount, and an
    optional message so I can pay friends and family.
7. As a user, I want to receive money and get notified when a payment is made to me so I
    can stay informed of my finances.
8. As a user, I want to cancel a pending payment request if it hasn’t been accepted so I can
    fix mistakes.
9. As a user, I want to split a payment with multiple users so we can divide shared expenses
    (e.g., dinner bills).
10. As a user, I want to set a default payment method (Venmo balance, bank account, or card)
    to control how payments are funded.

Account & Balance Features:

11. As a user, I want to view my current balance so I know how much money I have
    available.
12. As a user, I want to transfer money from my Venmo balance to my linked bank account
    so I can access my funds outside the app.


13. As a user, I want to add money to my balance from a linked account to ensure I have
    enough funds to pay others.14. As a user, I want to view a complete transaction history
    with filters (e.g., dates, keywords) to track my financial activity.

Friends & Social Features:

14. As a user, I want to search for and add friends by name or username so I can easily pay
    the right people.
15. As a user, I want to see a feed of my friends’ public transactions to stay socially
    connected.
16. As a user, I want to set privacy levels on each transaction (private, friends-only, or public)
    to control who sees my activity.
17. As a user, I want to react to my friends' transactions.

Administrative & Security Access:

18. As an admin, I want to access all transaction records and user profiles to monitor system
    integrity and investigate issues.
19. As a compliance officer, I want to flag and review suspicious transactions to detect
    potential fraud or money laundering.
20. As a business analyst, I want to generate reports on transaction volume, usage trends, and
    active users to support business growth and improvements.

### Business Rules

1. USERS can send many PAYMENTS.
2. PAYMENTS are initiated by one and only one USER (the sender).
3. USERS can receive many PAYMENTS.
4. PAYMENTS are received by one and only one USER (the receiver).
5. USERS can make many FRIENDREQUESTS.
6. FRIENDREQUESTS are sent by one and only one USER, and received by one and only
    one USER.
7. USERS can have one or more BALANCES.
8. BALANCES are associated with one and only one USER.
9. BALANCES may be funded by one or more FUNDINGSOURCES (bank account, debit
    card, etc.).
10. FUNDINGSOURCES can be linked to one and only one USER.
11. USERS can update one or more PROFILEUPDATES.
12. PROFILEUPDATES are associated with one and only one USER.
13. PAYMENTS can be linked to one and only one PRIVACYSETTING.
14. PRIVACYSETTING (Public, Friends-only, Private) can be applied to many
    PAYMENTS.
15. USERS can perform one or more IDENTITYVERIFICATIONS.
16. IDENTITYVERIFICATIONS are associated with one and only one USER.
17. USERS can create one or more PAYMENTREQUESTS.
18. PAYMENTREQUESTS are made to one or more USERS (recipients).
19. TRANSACTIONS can be flagged by one or more ADMINS for review.
20. ADMINS can flag many TRANSACTIONS.


21. ADMINS generate one or more ACTIVITYREPORTS.
22. ACTIVITYREPORTS can include data from many USERS and TRANSACTIONS.
23. COMPLIANCEOFFICERS can review one or more FLAGGEDTRANSACTIONS.
24. FLAGGEDTRANSACTIONS are reviewed by one and only one
    COMPLIANCEOFFICER.
25. USERS can have one or more TRANSACTIONHISTORIES.

### 26. TRANSACTIONHISTORIES belong to one and only one USER.


### Data Outputs/Business Questions

```
Business
Question
```
```
Stakeholder Use Why How Tables Involved
```
1 Top Active
Users by
Volume

```
VP of
Growth
```
```
Strategic Identify
power users
```
```
Target
loyalty/referral
campaigns
```
```
Users,
Transactions
```
2 Daily
Transactions
& Revenue

```
Finance Operational Track
platform
financials
```
```
Liquidity &
anomaly
detection
```
```
Transactions,
Users
```
3 Monthly
Trends by
Payment
Method

```
Product Strategic Understand
preferences
```
```
Promote
preferred
methods
```
```
Transactions,
Payment_Methods,
Users
```
4 Suspicious
Transactions
Over Time

```
Risk Analyst Operational Fraud/AML
monitoring
```
```
Timely
reviews &
alerts
```
```
Transactions,
Users,
Transaction_Flags
```
5 User Growth
by Region &
Source

```
VP of
Marketing
```
```
Strategic Evaluate
campaigns
```
```
Optimize
targeting
```
```
Users, Regions,
Referrals
```
6 Pending vs.
Completed
Summary

```
CS Manager Operational Spot flow
issues
```
```
Support
prioritization
```
```
Transactions,
Users
```
7 Retention by
Signup
Month

```
Product
Manager
```
```
Strategic Measure
engagement
```
```
Identify
drop-offs
```
```
Users,
Transactions
```
8 Transaction
History
(User)

```
End User Operational Reconcile
finances
```
```
Build trust Transactions,
Users,
Payment_Methods
```
9 Login
Attempts &
Devices

```
Security
Analyst
```
```
Operational Detect
breaches
```
```
Early warning Users, Login_Logs
```
10 Top
Friends-of-Fri
ends

```
Social
Product
Team
```
```
Strategic Social
clustering
```
```
Guide feature
design
```
```
Users, Friendships,
(Transactions)
```

### Entity Relationship Diagrams




### Database Implementation

Here is a sample of our DDL code. The file is attached at the end of this report:


Here is a sample of our DML code, the file is attached at the end of this report:

### Answer Business Questions

Below are our SQL queries used to answer our business questions, along with some selected
outputs and some brief analyses:

**1. Total transaction volume processed by Venmo this year**
SELECT SUM(amount) AS total_transaction_volume
FROM Transaction
WHERE YEAR(timestamp) = YEAR(CURDATE());


**2. Number of users who created accounts in the last month**
SELECT COUNT(*) AS new_users_last_month
FROM User
WHERE registration_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);
**3. Users with the highest number of sent payments**
SELECT u.user_id, u.first_name, u.last_name, COUNT(t.transaction_id) AS sent_count
FROM User u
JOIN Transaction t ON u.user_id = t.sender_user_id
GROUP BY u.user_id
ORDER BY sent_count DESC
LIMIT 10;


**4. Users who receive the most payments**
SELECT u.user_id, u.first_name, u.last_name, COUNT(t.transaction_id) AS received_count
FROM User u
JOIN Transaction t ON u.user_id = t.recipient_user_id
GROUP BY u.user_id
ORDER BY received_count DESC
LIMIT 10;
**5. Average transaction amount across all users**
SELECT AVG(amount) AS average_transaction_amount
FROM Transaction;

**Average transaction amount across all users:** Based on the mock data, the average transaction
amount across all users was approximately $5,059. While this figure provides a numerical
baseline, it is significantly higher than what would typically be expected in a real peer-to-peer
payment platform like Venmo, where most transactions are significantly less. This inflated
average is a result of our randomized data generation process.


**6. Most frequently used funding source**
SELECT method_type, COUNT(*) AS usage_count
FROM Payment_Method
JOIN User ON User.user_id = Payment_Method.payment_method_id
GROUP BY method_type
ORDER BY usage_count DESC
LIMIT 1;

**Most frequently used funding source:** Among the available funding methods in the mock
dataset, Google Pay was the most frequently used payment platform, appearing in 181
transactions. This suggests a user preference or default selection for Google Pay.

**7. Percentage of users verified with KYC procedures**
SELECT
ROUND(SUM(CASE WHEN is_verified = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS percent_verified
FROM Payment_Method;
**8. Users with the highest Venmo balance**
SELECT u.user_id, u.first_name, u.last_name, ub.balance_amount
FROM User u
JOIN User_Balance_Entry ub ON u.user_id = ub.balance_id
ORDER BY ub.balance_amount DESC
LIMIT 10;


**9. How often users transfer funds to bank accounts**
SELECT u.user_id, u.first_name, COUNT(*) AS bank_transfer_count
FROM Transaction t
JOIN User u ON t.sender_user_id = u.user_id
JOIN Transfer_Type tt ON t.transaction_id = tt.transfer_type_id
WHERE tt.type_name = 'Bank Transfer'
GROUP BY u.user_id;
**10. Users who canceled the most payment requests**
SELECT u.user_id, u.first_name, COUNT(*) AS canceled_requests
FROM Transaction t
JOIN User u ON t.sender_user_id = u.user_id
WHERE t.transaction_status = 'Cancelled'
GROUP BY u.user_id
ORDER BY canceled_requests DESC
LIMIT 10;


**11. Users with the most friends**
SELECT u.user_id, u.first_name, COUNT(*) AS friend_count
FROM User u
JOIN Friendship f ON u.user_id = f.user_id_1 OR u.user_id = f.user_id_
GROUP BY u.user_id
ORDER BY friend_count DESC
LIMIT 10;
**12. Most common privacy setting for transactions**
SELECT privacy_setting, COUNT(*) AS count
FROM Transaction
GROUP BY privacy_setting
ORDER BY count DESC
LIMIT 1;
**13. Days/times with the highest number of transactions**
SELECT DATE(timestamp) AS date, COUNT(*) AS txn_count
FROM Transaction
GROUP BY date
ORDER BY txn_count DESC
LIMIT 10;


**Days with the highest number of transactions:** Due to the synthetic nature of the dataset
created using Mockaroo, transaction volume per day was relatively limited. The highest
transaction activity observed was 4 transactions on a single day, followed by days with 3 and 2
transactions respectively. These peak days occurred between 2013 and 2023, without a consistent
trend or identifiable seasonality.

**14. States or regions with highest user density**
SELECT state, COUNT(*) AS user_count
FROM User_Address
GROUP BY state
ORDER BY user_count DESC
LIMIT 10;


**States with the highest user density:** In the mock dataset, Kansas has the highest number of
users, with 29 accounts registered in the state. Minnesota follows closely with 28 users, while
Iowa, Louisiana, and Wisconsin each have 26 users. Although these figures are artificially
generated and not representative of real-world trends, (we would expect many more users per
state) understanding user density by location helps identify regional trends, support marketing
efforts, and improve overall service.

**15. Flagged transactions reviewed by compliance this quarter**
SELECT COUNT(*) AS flagged_this_quarter
FROM Dispute
WHERE QUARTER(created_timestamp) = QUARTER(CURDATE())
AND YEAR(created_timestamp) = YEAR(CURDATE());
**16. Which flagged transactions were confirmed as under review**
SELECT *
FROM Dispute
WHERE dispute_status = 'Under review';
**17. Users with the most reported or restricted accounts**
SELECT u.user_id, u.first_name, COUNT(d.dispute_id) AS dispute_count
FROM User u
JOIN Transaction t ON u.user_id = t.sender_user_id OR u.user_id = t.recipient_user_id
JOIN Dispute d ON t.transaction_id = d.dispute_id
GROUP BY u.user_id
ORDER BY dispute_count DESC
LIMIT 10;


**Users with the highest most reported or restricted accounts:** The data shows that one user has
been involved in 5 disputes, while five other users each have 4 reported disputes. Identifying
users with frequent disputes is important for flagging potential fraud, abuse, or misuse of the
platform. This information can help administrators prioritize account reviews or investigations.

**18. Average response time to complete a payment request**
SELECT AVG(TIMESTAMPDIFF(DAY, created_timestamp, resolved_timestamp)) AS avg_response_time_days
FROM Dispute
WHERE resolved_timestamp IS NOT NULL;
**19. What is the average number of transactions per business per month?**
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
**20. Average number of payments a user makes per month**
SELECT AVG(monthly_count) AS avg_payments_per_user
FROM (
SELECT sender_user_id, COUNT(*) / COUNT(DISTINCT MONTH(timestamp)) AS monthly_count
FROM Transaction
GROUP BY sender_user_id
) AS user_monthly_avg;
**21. Peer-to-peer vs business transactions**
SELECT
SUM(CASE WHEN bp.user_id IS NULL THEN 1 ELSE 0 END) AS peer_to_peer,


SUM(CASE WHEN bp.user_id IS NOT NULL THEN 1 ELSE 0 END) AS business_related
FROM Transaction t
LEFT JOIN Business_Profile bp ON t.recipient_user_id = bp.user_id;

**22. How many user have a business profile?**
SELECT COUNT(DISTINCT user_id) AS total_users_with_business_profile
FROM Business_Profile;

### Summary & Conclusion

Project Component Summary:
We began by researching Venmo’s operations and business model to understand the platform’s
core functionalities. Based on this research, we developed 20 user requirements and 20 business
rules to guide the structure and design of our prototype database. Using these, we created
conceptual, logical, and physical data models to outline a scalable relational schema. We then
implemented the database using SQL and populated it with sample data generated via Mockaroo.
Finally, we ran a set of queries to explore how the database could answer practical business
questions, such as identifying active users, tracking transaction volume, and analyzing user
growth.

Why Sponsor this Project:
Sponsoring the creation of this database model offers a valuable opportunity to explore how a
well-structured data system could support Venmo’s core functions and enable clearer operational
insights. While this project is a prototype, it demonstrates how thoughtful database design lays
the groundwork for accurate transaction tracking, user behavior analysis, and strategic reporting.

Key benefits include:
● Stronger data foundations: A relational schema that captures key elements of Venmo’s
activity such as user information, transactions, and account balances.
● Operational insight: Queries that show user growth, transaction trends, and behavioral
patterns across different user segments.
● Improved visibility: Easier access to aggregated data for business reporting, customer
support patterns, or platform performance indicators.

In a data-centric business environment, this project shows how investing in relational data
infrastructure can support more informed decision-making, better monitoring, and long-term
operational value.

## References and Appendix

1. Mockaroo. (n.d.). _Mock data generator_. https://mockaroo.com/
2. GeeksforGeeks. (n.d.). _SQL commands: DDL, DQL, DML, DCL, TCL_.
    https://www.geeksforgeeks.org/sql/sql-ddl-dql-dml-dcl-tcl-commands/
3. Lucidchart. (n.d.). _Venmo ER diagram_.
    https://lucid.app/lucidchart/89214b0e-384f-4a9f-9f3e-9258d1426044/edit?invitationId=in
    v_1d3f1b7b-1182-4498-9d8b-3992af821a9f&page=Qf-wWQ1U0cSd#
4. OpenAI. (n.d.). _ChatGPT_. https://chatgpt.com/


5. Web Dev Simplified. (2021, July 13). _SQL full course for beginners (Learn SQL in 6_
    _hours)_ [Video]. YouTube. https://www.youtube.com/watch?v=xsg9BDiwiJE
6. Bro Code. (2022, October 15). _MySQL full course for free_ 🐬 [Video]. YouTube.
    https://www.youtube.com/watch?v=dikYIgaWlkE
7. TechTFQ. (2022, January 18). _SQL tutorial - Full database project (Beginners to_
    _Advanced)_ [Video]. YouTube. https://www.youtube.com/watch?v=S_oYFGhZSkQ

