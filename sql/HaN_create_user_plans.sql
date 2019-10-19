CREATE DATABASE `health_app` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `health_app`;

DROP TABLE IF EXISTS `user`;

CREATE TABLE IF NOT EXISTS `user` (
  `name` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ;

DROP TABLE IF EXISTS `user_plan`;

CREATE TABLE IF NOT EXISTS `user_plan` (
  `user_name` varchar(32) NOT NULL,
  `food_id` int(10) NOT NULL,
  `count` int(10) NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_name`,`food_id`),
  FOREIGN KEY (`user_name`) REFERENCES user(`name`),
  FOREIGN KEY (`food_id`) REFERENCES food(`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ;

