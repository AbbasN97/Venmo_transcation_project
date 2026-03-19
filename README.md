# Final Project Report: Venmo
**ShyAnn Ball**  
**Abbas Naqvi**  
**Meimei Peterson**  
**Haley Young**  
IS 4420 Summer 2025  

---

## Table of Contents
- Team Introduction  
- Executive Summary  
- User Requirements  
- Business Rules  
- Data Outputs / Business Questions  
- Entity Relationship Diagrams  
- Database Implementation  
- Answer Business Questions  
- Summary & Conclusion  
- References and Appendix  

---

## Team Introduction
- **ShyAnn Ball** – Operations & Supply Chain major, VP of Alpha Phi, works at a golf course in Park City.  
- **Abbas Naqvi** – Information Systems major, works in ITS Field Services at University of Utah Hospital.  
- **Meimei Peterson** – Operations & Supply Chain major, minors in Accounting & Entrepreneurship, intern at reproductive health startup.  
- **Haley Young** – Computer Science major, minors in Physics & Information Systems, intern with Fight Against Domestic Violence.  

---

## Executive Summary
This project involves designing a **relational database** to support Venmo, a peer-to-peer mobile payment service owned by PayPal.

Venmo allows users to:
- Send and receive money  
- Link bank accounts or debit cards  
- Interact socially via a transaction feed  

### Revenue Model
- Instant transfer fees  
- Merchant transaction fees  
- Premium services (e.g., debit cards)  

### System Capabilities
- Transaction logging  
- Account balance tracking  
- User data management  
- Social feed visibility  

The database was populated with **Mockaroo-generated data** and analyzed using SQL queries to:
- Track transactions  
- Measure user growth  
- Identify active users  

---

## User Requirements

### Account Creation & Authentication
1. Create account (email, phone, password)  
2. Secure login/logout  
3. Identity verification (KYC)  
4. Update profile details  
5. Admin tracking for compliance  

### Transaction Management
6. Send money  
7. Receive notifications  
8. Cancel pending payments  
9. Split payments  
10. Set default payment method  

### Account & Balance Features
11. View balance  
12. Transfer to bank  
13. Add funds  
14. View transaction history  

### Friends & Social Features
15. Add/search friends  
16. View transaction feed  
17. Set privacy levels  
18. React to transactions  

### Administrative & Security Access
19. Admin access to all records  
20. Fraud detection & monitoring  
21. Generate business reports  

---

## Business Rules
- Users can send/receive many payments  
- Payments have one sender and one receiver  
- Users can have multiple balances  
- Each balance belongs to one user  
- Users can have multiple funding sources  
- Payments have privacy settings  
- Admins can flag transactions  
- Compliance officers review flagged transactions  
- Users maintain transaction histories  

---

## Data Outputs / Business Questions

| # | Business Question | Stakeholder | Purpose |
|--|------------------|------------|--------|
| 1 | Top active users | VP Growth | Identify power users |
| 2 | Daily transactions & revenue | Finance | Track financials |
| 3 | Monthly payment trends | Product | Understand preferences |
| 4 | Suspicious transactions | Risk Analyst | Fraud monitoring |
| 5 | User growth by region | Marketing | Optimize campaigns |
| 6 | Pending vs completed | CS Manager | Improve flow |
