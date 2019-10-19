

-- Database Number	Food Group	Food Name	Protein (g)	Fat (g)	Carbohydrates (g)	Calories	Caffeine (mg)	Sugar (g)	Fiber (g)	Calcium (mg)	Iron (mg)	Magnesium (mg)	Potasssium (mg)	Sodium (mg)	Zinc (mg)	Copper (mg)	Manganese (mg)	Selenium (mcg)	Vitamin A (IU)	Vitamin E (mg)	Vitamin D (mcg)	Vitamin C (mg)	Vitamin B12	Cholesterol (mcg)	Saturated Fat (g)

USE `health_app`;

SELECT * FROM food;

SELECT @@GLOBAL.secure_file_priv;
SHOW VARIABLES LIKE "secure_file_priv";

-- LOAD food_nutrition
LOAD DATA INFILE '../uploaded/USDA-SR28-V1_REDUCED_COLUMNS_FINAL.txt'
INTO TABLE food
CHARACTER SET utf8mb4
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\t\r\n'
IGNORE 4 LINES
(@food_id,@food_group,@food_name,@protein,@fat,@carbs,@calories,@caff,@sug,@fib,@ca,@fe,@mg,@k,@na,@zn,@cu,@mn,@se,@vit_a,@vit_e,@vit_d,@vit_c,@vit_b12,@cholest,@sat_fat)
SET ID = NULLIF(@food_id,'NULL'),
FOOD_GROUP = NULLIF(@food_group,'NULL'),
FOOD_NAME = NULLIF(@food_name,'NULL'),
PROTEIN = COALESCE(NULLIF(@protein,'NULL'),0),
FAT = COALESCE(NULLIF(@fat,'NULL'),0),
CARBOHYDRATES = COALESCE(NULLIF(@carbs,'NULL'),0),
CALORIES = COALESCE(NULLIF(@calories,'NULL'),0),
CAFFEINE = COALESCE(NULLIF(@caff,'NULL'),0),
SUGAR = COALESCE(NULLIF(@sug,'NULL'),0),
FIBER = COALESCE(NULLIF(@fib,'NULL'),0),
CALCIUM = COALESCE(NULLIF(@ca,'NULL'),0),
IRON = COALESCE(NULLIF(@fe,'NULL'),0),
MAGNESIUM = COALESCE(NULLIF(@mg,'NULL'),0),
POTASSIUM = COALESCE(NULLIF(@k,'NULL'),0),
SODIUM = COALESCE(NULLIF(@na,'NULL'),0),
ZINC = COALESCE(NULLIF(@zn,'NULL'),0),
COPPER = COALESCE(NULLIF(@cu,'NULL'),0),
MANGANESE = COALESCE(NULLIF(@mn,'NULL'),0),
SELENIUM = COALESCE(NULLIF(@se,'NULL'),0),
VITAMIN_A = COALESCE(NULLIF(@vit_a,'NULL'),0),
VITAMIN_E = COALESCE(NULLIF(@vit_e,'NULL'),0),
VITAMIN_D = COALESCE(NULLIF(@vit_d,'NULL'),0),
VITAMIN_C = COALESCE(NULLIF(@vit_c,'NULL'),0),
VITAMIN_B12 = COALESCE(NULLIF(@vit_b12,'NULL'),0),
CHOLESTEROL = COALESCE(NULLIF(@cholest,'NULL'),0),
SATURATED_FAT = COALESCE(NULLIF(@sat_fat,'NULL'),0);