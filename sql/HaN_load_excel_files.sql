

-- Database Number,Food Group,Food Name,Protein (g),Fat (g),Carbohydrates (g),Ash (g),Calories,Starch (g),Sucrose (g),Glucose (g),Fructose (g),Lactose (g),Maltose (g),Alcohol (g),Water (g),Caffeine (mg),Theobromine (mg),Sugar (g),Galactose (g),Fiber (g),Calcium (mg),Iron (mg),Magnesium (mg),Phosphorus (mg),Potasssium (mg),Sodium (mg),Zinc (mg),Cupper (mg),Fluoride (mcg),Manganese (mg),Selenium (mcg),Vitamin A (IU),Retinol (mcg),Retinol Equivalents (mcg),Beta Carotene (mcg),Alpha Carotene (mcg),Vitamin E (mg),Vitamin D (mcg),Vitamin D2 (Ergocalciferol)  (mcg),Vitamin D3 (Cholecalciferol) (mcg),Beta Cryptoxanthin (mcg),Lycopene (mcg),Lutein and Zeaxanthin (mcg),Vitamin C (mg),Thiamin (B1) (mg),Riboflavin (B2) (mg),Niacin (B3) (mg),Vitamin B5 (mg),Vitamin B6 (mg),Folate (B9) (mg),Vitamin B12,Choline (mg),Cholesterol (mg),Saturated Fat (g),Net Carbs,,

-- LOAD food_nutrition
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/USDA-SR28-V1_REDUCED_COLUMNS.txt'
INTO TABLE food_nutrition
CHARACTER SET utf8mb4
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 4 LINES
(@food_id,@food_group,@food_name,@protein,@fat,@carbs,@ash,@calories)
SET FOOD_ID = NULLIF(@food_id,'NULL'),
FOOD_GROUP = NULLIF(@food_group,'NULL'),
FOOD_NAME = NULLIF(@food_name,'NULL'),
PROTEIN = NULLIF(@protein,'NULL'),
FAT = NULLIF(@fat,'NULL'),
CARBOHYDRATES = NULLIF(@carbs,'NULL'),
ASH = NULLIF(@ash,'NULL'),
CALORIES = NULLIF(@calories,'NULL');

-- DELETE from food_nutrition where food_id >999;
