use `health_app`;

select * from user;

insert into `user` (`name`,`password`) values
	('admin','123');
    
select * from food;

select * from user_plan;

insert into `food` (`group`,`name`,`calories`) values
	('Dairy and Egg Products','Butter, salted',717),
    ('Dairy and Egg Products','Butter, whipped, with salt',718),
    ('Dairy and Egg Products','Butter oil, anhydrous',876),
    ('Dairy and Egg Products','Cheese, blue',353),
    ('Dairy and Egg Products','Cheese, brick',371),
    ('Dairy and Egg Products','Cheese, brie',334),
    ('Dairy and Egg Products','Cheese, camembert',300),
    ('Dairy and Egg Products','Cheese, caraway',376),
    ('Dairy and Egg Products','Cheese, cheddar',404),
    ('Dairy and Egg Products','Cheese, cheshire',387),
    ('Dairy and Egg Products','Cheese, colby',394);