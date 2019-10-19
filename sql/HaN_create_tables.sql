-- COLUMN NAMES ARE WRITTEN IN ALL CAPS

SELECT * FROM food;
DROP TABLE IF EXISTS `food`;
-- CREATE TABLE 'food_nutrition'
CREATE TABLE `food` (
		ID INT NOT NULL,
        FOOD_GROUP VARCHAR(100),
        FOOD_NAME VARCHAR(200),
        PROTEIN FLOAT COMMENT '(g)',
        FAT FLOAT COMMENT '(g)',
        CARBOHYDRATES FLOAT COMMENT '(g)',
        CALORIES FLOAT COMMENT '(kCal (=Calories)',
        CAFFEINE FLOAT COMMENT '(mg)',
        SUGAR FLOAT COMMENT '(g)',
		FIBER FLOAT COMMENT '(g)',
		CALCIUM FLOAT COMMENT '(mg)',
		IRON FLOAT COMMENT '(mg)',
		MAGNESIUM FLOAT COMMENT '(mg)',
		POTASSIUM FLOAT COMMENT '(mg)',
		SODIUM FLOAT COMMENT '(mg)',
		ZINC FLOAT COMMENT '(mg)',
		COPPER FLOAT COMMENT '(mg)',
		MANGANESE FLOAT COMMENT '(mg)',
		SELENIUM FLOAT COMMENT '(mcg)',
		VITAMIN_A FLOAT COMMENT '(IU)',
		VITAMIN_E FLOAT COMMENT '(mg)',
		VITAMIN_D FLOAT COMMENT '(mcg)',
		VITAMIN_C FLOAT COMMENT '(mg)',
		VITAMIN_B12 FLOAT COMMENT '(mg)',
		CHOLESTEROL FLOAT COMMENT '(mg)',
		SATURATED_FAT FLOAT COMMENT '(g)',
		PRIMARY KEY (ID),
        INDEX(ID)
);

-- Database Number,Food Group,Food Name,Protein (g),Fat (g),Carbohydrates (g),Ash (g),Calories,Starch (g),Sucrose (g),Glucose (g),Fructose (g),Lactose (g),Maltose (g),Alcohol (g),Water (g),Caffeine (mg),Theobromine (mg),Sugar (g),Galactose (g),Fiber (g),Calcium (mg),Iron (mg),Magnesium (mg),Phosphorus (mg),Potasssium (mg),Sodium (mg),Zinc (mg),Cupper (mg),Fluoride (mcg),Manganese (mg),Selenium (mcg),Vitamin A (IU),Retinol (mcg),Retinol Equivalents (mcg),Beta Carotene (mcg),Alpha Carotene (mcg),Vitamin E (mg),Vitamin D (mcg),Vitamin D2 (Ergocalciferol)  (mcg),Vitamin D3 (Cholecalciferol) (mcg),Beta Cryptoxanthin (mcg),Lycopene (mcg),Lutein and Zeaxanthin (mcg),Vitamin C (mg),Thiamin (B1) (mg),Riboflavin (B2) (mg),Niacin (B3) (mg),Vitamin B5 (mg),Vitamin B6 (mg),Folate (B9) (mg),Vitamin B12,Choline (mg),Cholesterol (mg),Saturated Fat (g),Net Carbs,,