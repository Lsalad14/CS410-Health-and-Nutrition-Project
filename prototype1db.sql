CREATE DATABASE `health_app` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `health_app`;

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

CREATE TABLE IF NOT EXISTS `food` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `group` varchar(64) NOT NULL,
  `name` varchar(256) NOT NULL,
  `protein` float(10),
  `fat` float(10),
  `carbohydrates` float(10),
  `ash` float(10),
  `calories` float(10),
  `starch` float(10),
  `sucrose` float(10),
  `glucose` float(10),
  `fructose` float(10),
  `lactose` float(10),
  `maltose` float(10),
  `alcohol` float(10),
  `water` float(10),
  `caffeine` float(10),
  `theobromine` float(10),
  `sugar` float(10),
  `galactose` float(10),
  `fiber` float(10),
  `calcium` float(10),
  `magnesium` float(10),
  `phosphorus` float(10),
  `potassium` float(10),
  `sodium` float(10),
  `zinc` float(10),
  `copper` float(10),
  `fluoride` float(10),
  `manganese` float(10),
  `selenium` float(10),
  `vitamin_a` float(10),
  `retinol` float(10),
  `retinol_equiv` float(10),
  `b_carotene` float(10),
  `a_carotene` float(10),
  `vitamin_e` float(10),
  `vitamin_d` float(10),
  `vitamin_d2` float(10),
  `vitamin_d3` float(10),
  `b_cryptoxanthin` float(10),
  `lycopene` float(10),
  `lutein` float(10),
  `vitamin_c` float(10),
  `thiamin` float(10),
  `riboflavin` float(10),
  `niacin` float(10),
  `vitamin_b5` float(10),
  `vitamin_b6` float(10),
  `folate` float(10),
  `vitamin_b12` float(10),
  `choline` float(10),
  `cholesterol` float(10),
  `saturated_fat` float(10),
  `net_carbs` float(10),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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

