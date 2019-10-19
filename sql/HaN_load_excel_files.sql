

-- Database Number	Food Group	Food Name	Protein (g)	Fat (g)	Carbohydrates (g)	Calories	Caffeine (mg)	Sugar (g)	Fiber (g)	Calcium (mg)	Iron (mg)	Magnesium (mg)	Potasssium (mg)	Sodium (mg)	Zinc (mg)	Copper (mg)	Manganese (mg)	Selenium (mcg)	Vitamin A (IU)	Vitamin E (mg)	Vitamin D (mcg)	Vitamin C (mg)	Vitamin B12	Cholesterol (mcg)	Saturated Fat (g)


-- LOAD food_nutrition
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/USDA-SR28-V1_REDUCED_COLUMNS_FINAL.txt'
INTO TABLE food_nutrition
CHARACTER SET utf8mb4
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\t\r\n'
IGNORE 4 LINES
(@food_id,@food_group,@food_name,@protein,@fat,@carbs,@calories,@caff,@sug,@fib,@ca,@fe,@mg,@k,@na,@zn,@cu,@mn,@se,@vit_a,@vit_e,@vit_d,@vit_c,@vit_b12,@cholest,@sat_fat)
SET FOOD_ID = NULLIF(@food_id,'NULL'),
FOOD_GROUP = NULLIF(@food_group,'NULL'),
FOOD_NAME = NULLIF(@food_name,'NULL'),
PROTEIN = NULLIF(@protein,'NULL'),
FAT = NULLIF(@fat,'NULL'),
CARBOHYDRATES = NULLIF(@carbs,'NULL'),
CALORIES = NULLIF(@calories,'NULL'),
CAFFEINE = NULLIF(@caff,'NULL'),
SUGAR = NULLIF(@sug,'NULL'),
FIBER = NULLIF(@fib,'NULL'),
CALCIUM = NULLIF(@ca,'NULL'),
IRON = NULLIF(@fe,'NULL'),
MAGNESIUM = NULLIF(@mg,'NULL'),
POTASSIUM = NULLIF(@k,'NULL'),
SODIUM = NULLIF(@na,'NULL'),
ZINC = NULLIF(@zn,'NULL'),
COPPER = NULLIF(@cu,'NULL'),
MANGANESE = NULLIF(@mn,'NULL'),
SELENIUM = NULLIF(@se,'NULL'),
VITAMIN_A = NULLIF(@vit_a,'NULL'),
VITAMIN_E = NULLIF(@vit_e,'NULL'),
VITAMIN_D = NULLIF(@vit_d,'NULL'),
VITAMIN_C = NULLIF(@vit_c,'NULL'),
VITAMIN_B12 = NULLIF(@vit_b12,'NULL'),
CHOLESTEROL = NULLIF(@cholest,'NULL'),
SATURATED_FAT = NULLIF(@sat_fat,'NULL');