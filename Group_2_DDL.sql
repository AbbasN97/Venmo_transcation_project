CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `Phone_number` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `unique_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `transfer_type` (
  `transfer_type_id` varchar(20) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `description` text,
  PRIMARY KEY (`transfer_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `payment_method` (
  `payment_method_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `method_type` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `expiration_state` varchar(10) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `payment_method_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL,
  `sender_user_id` int DEFAULT NULL,
  `recipient_user_id` int DEFAULT NULL,
  `transfer_type_id` varchar(20) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `transaction_status` varchar(20) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `description` text,
  `privacy_setting` varchar(20) DEFAULT NULL,
  `fee_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `sender_user_id` (`sender_user_id`),
  KEY `recipient_user_id` (`recipient_user_id`),
  KEY `fk_transaction_transfer_type` (`transfer_type_id`),
  CONSTRAINT `fk_transaction_transfer_type` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_type` (`transfer_type_id`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`recipient_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `authentication` (
  `authentication_id` varchar(30) NOT NULL,
  `user_id` int DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `last_used` datetime DEFAULT NULL,
  PRIMARY KEY (`authentication_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `authentication_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `bank_account` (
  `bank_account_id` varchar(20) NOT NULL,
  `payment_method_id` int DEFAULT NULL,
  `routing_number` varchar(20) DEFAULT NULL,
  `account_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bank_account_id`),
  KEY `payment_method_id` (`payment_method_id`),
  CONSTRAINT `bank_account_ibfk_1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `business_profile` (
  `user_id` int NOT NULL,
  `business_name` varchar(100) DEFAULT NULL,
  `business_category` varchar(50) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `business_address` varchar(150) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `business_profile_ibfk_2` (`username`),
  CONSTRAINT `business_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `business_profile_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `card` (
  `card_id` int NOT NULL,
  `payment_method_id` int DEFAULT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `card_type` varchar(20) DEFAULT NULL,
  `billing_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  KEY `payment_method_id` (`payment_method_id`),
  CONSTRAINT `card_ibfk_1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `comment` (
  `comment_id` int NOT NULL,
  `transaction_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `comment_text` text,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `fk_comment_transaction` (`transaction_id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_transaction` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `customer_support_ticket` (
  `ticket_id` varchar(30) NOT NULL,
  `user_id` int DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `description` text,
  `status` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ticket_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `customer_support_ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `dispute` (
  `dispute_id` int NOT NULL,
  `transaction_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `dispute_reason` text,
  `dispute_status` varchar(50) DEFAULT NULL,
  `created_timestamp` datetime DEFAULT NULL,
  `resolved_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`dispute_id`),
  KEY `user_id` (`user_id`),
  KEY `fk_dispute_transaction` (`transaction_id`),
  CONSTRAINT `dispute_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dispute_transaction` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `friendship` (
  `friendship_id` int NOT NULL,
  `user_id_1` int DEFAULT NULL,
  `user_id_2` int DEFAULT NULL,
  `friendship_status` varchar(20) DEFAULT NULL,
  `established_date` date DEFAULT NULL,
  PRIMARY KEY (`friendship_id`),
  KEY `user_id_1` (`user_id_1`),
  KEY `user_id_2` (`user_id_2`),
  CONSTRAINT `friendship_ibfk_1` FOREIGN KEY (`user_id_1`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `friendship_ibfk_2` FOREIGN KEY (`user_id_2`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `notification` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `notification_type` varchar(19) DEFAULT NULL,
  `message` varchar(27) DEFAULT NULL,
  `notification_timestamp` date DEFAULT NULL,
  `is_read` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `reaction` (
  `reaction_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `reaction_type` varchar(50) DEFAULT NULL,
  `reaction_timestamp` datetime DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  PRIMARY KEY (`reaction_id`),
  KEY `user_id` (`user_id`),
  KEY `fk_reaction_transaction1_idx1` (`transaction_id`),
  CONSTRAINT `fk_reaction_transaction1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`),
  CONSTRAINT `reaction_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `refund` (
  `refund_id` int NOT NULL,
  `transaction_id` int DEFAULT NULL,
  `refund_amount` decimal(10,2) DEFAULT NULL,
  `refund_reason` text,
  `refund_date` datetime DEFAULT NULL,
  `refund_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`refund_id`),
  KEY `fk_refund_transaction` (`transaction_id`),
  CONSTRAINT `fk_refund_transaction` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `transaction_participant` (
  `participant_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `transaction_id` int DEFAULT NULL,
  `amount_due` decimal(10,2) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`participant_id`),
  KEY `user_id` (`user_id`),
  KEY `transaction_id` (`transaction_id`),
  CONSTRAINT `transaction_participant_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaction_participant_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `user_address` (
  `address_id` varchar(30) NOT NULL,
  `user_id` int DEFAULT NULL,
  `street_address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `address_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `user_balance_entry` (
  `balance_id` varchar(20) NOT NULL,
  `user_id` int DEFAULT NULL,
  `balance_amount` decimal(10,2) DEFAULT NULL,
  `balance_timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`balance_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_balance_entry_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user_setting` (
  `setting_id` varchar(30) NOT NULL,
  `privacy_default` varchar(50) DEFAULT NULL,
  `notification_preferences` text,
  `security_settings` text,
  `user_id` int NOT NULL,
  PRIMARY KEY (`setting_id`,`user_id`),
  KEY `fk_user_setting_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_setting_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
