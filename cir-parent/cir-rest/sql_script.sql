create database `peoplespulse`;

use `peoplespulse`;

DROP TABLE IF EXISTS `tbl_roles`;

CREATE TABLE `tbl_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) NOT NULL,
  `role_description` varchar(100) DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbl_roles` (`role_name`, `role_description`, `is_active`) VALUES ('ADMIN', 'Admin', '1');
INSERT INTO `tbl_roles` (`role_name`, `role_description`, `is_active`) VALUES ('USER', 'User', '1');


DROP TABLE IF EXISTS `tbl_users`;

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `tbl_user_tbl_role` (`role_id`),
  CONSTRAINT `tbl_user_tbl_role` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tbl_user_prpfile`;

CREATE TABLE `tbl_user_profile` (
  `user_profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `aadhar_id` varchar(12) DEFAULT NULL,
  `photograph` longtext,
  `email_id` varchar(45) DEFAULT NULL,
  `mobile_number` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `blood_group_id` int(11) DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`user_profile_id`),
  UNIQUE KEY `user_profile_id` (`user_profile_id`),
  KEY `tbl_user_profile_tbl_user` (`user_id`),
  CONSTRAINT `tbl_user_profile_tbl_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tbl_status`;

CREATE TABLE `tbl_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(45) DEFAULT NULL,
  `status_desc` varchar(45) DEFAULT NULL,
  `status_type` varchar(45) DEFAULT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tbl_request_category`;

CREATE TABLE `tbl_request_category` (
  `request_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_category_name` varchar(50) NOT NULL,
  `request_category_description` varchar(50) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`request_category_id`),
  UNIQUE KEY `request_category_id` (`request_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tbl_request`;

CREATE TABLE `tbl_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_title` longtext NOT NULL,
  `request_description` longtext NOT NULL,
  `request_code` varchar(20) DEFAULT NULL,
  `request_category_id` int(11) NOT NULL,
  `location` varchar(200) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  UNIQUE KEY `request_id` (`request_id`),
  KEY `tbl_request_category_tbl_request` (`request_category_id`),
  CONSTRAINT `tbl_request_category_tbl_request` FOREIGN KEY (`request_category_id`) REFERENCES `tbl_request_category` (`request_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tbl_request_work_allocation`;

CREATE TABLE `tbl_request_work_allocation` (
  `request_work_allocation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `request_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `assign_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `status_id` int(10) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `completed_percent` int(11) DEFAULT '0',
  PRIMARY KEY (`request_work_allocation_id`),
  UNIQUE KEY `request_work_allocation_id` (`request_work_allocation_id`),
  KEY `tbl_request_tbl_request_work_allocation` (`request_id`),
  KEY `FK_tbl_work_allocation_status` (`status_id`),
  CONSTRAINT `tbl_request_tbl_request_work_allocation` FOREIGN KEY (`request_id`) REFERENCES `tbl_request` (`request_id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_tbl_work_allocation_status` FOREIGN KEY (`status_id`) REFERENCES `tbl_status` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tbl_task_category`;

CREATE TABLE `tbl_task_category` (
  `task_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_category_name` varchar(50) NOT NULL,
  `task_category_description` varchar(50) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL,
  PRIMARY KEY (`task_category_id`),
  UNIQUE KEY `task_category_id` (`task_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tbl_task`;

CREATE TABLE `tbl_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_title` longtext NOT NULL,
  `task_description` longtext NOT NULL,
  `task_code` varchar(20) DEFAULT NULL,
  `task_category_id` int(11) NOT NULL,
  `location` varchar(200) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `tbl_task_category_tbl_task` (`task_category_id`),
  CONSTRAINT `tbl_task_category_tbl_task` FOREIGN KEY (`task_category_id`) REFERENCES `tbl_task_category` (`task_category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tbl_task_work_allocation`;

CREATE TABLE `tbl_task_work_allocation` (
  `task_work_allocation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `task_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `assign_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `status_id` int(10) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `completed_percent` int(11) DEFAULT '0',
  PRIMARY KEY (`task_work_allocation_id`),
  UNIQUE KEY `task_work_allocation_id` (`task_work_allocation_id`),
  KEY `tbl_task_tbl_task_work_allocation` (`task_id`),
  KEY `FK_tbl_task_work_allocation_status` (`status_id`),
  CONSTRAINT `tbl_task_tbl_task_work_allocation` FOREIGN KEY (`task_id`) REFERENCES `tbl_task` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `FK_tbl_task_work_allocation_status` FOREIGN KEY (`status_id`) REFERENCES `tbl_status` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tbl_comments`;

CREATE TABLE `tbl_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(150) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ref_id` int(11) NOT NULL,
`is_active` tinyint(4) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  UNIQUE KEY `comment_id` (`comment_id`),
  KEY `tbl_comment_tbl_user1` (`user_id`),
  CONSTRAINT `tbl_comment_tbl_user1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;