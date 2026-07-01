# Executive Summary


This project involves the development of a relational database designed to support the core 
operations of Venmo, a peer-to-peer mobile payment service owned by PayPal. Venmo allows 
users to send and receive money digitally, connect their bank accounts or debit cards, and engage 
with a social feed that displays transaction activity among friends. 
 
Venmo’s business model is built around facilitating digital financial transactions while promoting 
user engagement through social interaction. Although the platform is free to use for most P2P transfers, Venmo generates revenue through instant transfer fees, merchant transaction fees when 
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






# User Requirements  


### Account Creation & Authentication: 
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
### Transaction Management: 
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
### Account & Balance Features: 
11. As a user, I want to view my current balance so I know how much money I have 
available. 
12. As a user, I want to transfer money from my Venmo balance to my linked bank account 
so I can access my funds outside the app. 
13. As a user, I want to add money to my balance from a linked account to ensure I have 
enough funds to pay others.14. As a user, I want to view a complete transaction history 
with filters (e.g., dates, keywords) to track my financial activity. 
### Friends & Social Features: 
14. As a user, I want to search for and add friends by name or username so I can easily pay 
the right people. 
15. As a user, I want to see a feed of my friends’ public transactions to stay socially 
connected. 
16. As a user, I want to set privacy levels on each transaction (private, friends-only, or public) 
to control who sees my activity. 
17. As a user, I want to react to my friends' transactions. 
### Administrative & Security Access: 
18. As an admin, I want to access all transaction records and user profiles to monitor system 
integrity and investigate issues. 
19. As a compliance officer, I want to flag and review suspicious transactions to detect 
potential fraud or money laundering. 
20. As a business analyst, I want to generate reports on transaction volume, usage trends, and 
active users to support business growth and improvements.


## Business Rules 
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
26. TRANSACTIONHISTORIES belong to one and only one USER.


# Data Outputs/Business Questions
<img width="644" height="790" alt="image" src="https://github.com/user-attachments/assets/8c07acbf-c2e6-40c5-bdfa-c996ccee59a4" />



### Please refer to the Business_Question_Query.md for SQL queries
# Physical Model
<img width="2550" height="3300" alt="Business Report-images-8" src="https://github.com/user-attachments/assets/c856050c-09ce-4a2e-b91e-58217f87a536" />

# Summary & Conclusion 
## Project Component Summary: 
We began by researching Venmo’s operations and business model to understand the platform’s 
core functionalities. Based on this research, we developed 20 user requirements and 20 business 
rules to guide the structure and design of our prototype database. Using these, we created 
conceptual, logical, and physical data models to outline a scalable relational schema. We then 
implemented the database using SQL and populated it with sample data generated via Mockaroo. 
Finally, we ran a set of queries to explore how the database could answer practical business 
questions, such as identifying active users, tracking transaction volume, and analyzing user 
growth. 

## Why Sponsor this Project: 
Sponsoring the creation of this database model offers a valuable opportunity to explore how a 
well-structured data system could support Venmo’s core functions and enable clearer operational 
insights. While this project is a prototype, it demonstrates how thoughtful database design lays 
the groundwork for accurate transaction tracking, user behavior analysis, and strategic reporting. 
### Key benefits include:\
●  Stronger data foundations: A relational schema that captures key elements of Venmo’s 
activity such as user information, transactions, and account balances.\
●  Operational insight: Queries that show user growth, transaction trends, and behavioral 
patterns across different user segments. \
●  Improved visibility: Easier access to aggregated data for business reporting, customer 
support patterns, or platform performance indicators. \
In a data-centric business environment, this project shows how investing in relational data 
infrastructure can support more informed decision-making, better monitoring, and long-term 
operational value.
