-- COLUMN NAMES ARE WRITTEN IN ALL CAPS



-- CREATE TABLE 'food_nutrition'
CREATE TABLE `food_nutrition` (
		FOOD_ID INT NOT NULL,
        FOOD_GROUP VARCHAR(100),
        FOOD_NAME VARCHAR(200),
        PROTEIN FLOAT COMMENT '(g)',
        FAT FLOAT COMMENT '(g)',
        CARBOHYDRATES FLOAT COMMENT '(g)',
        ASH FLOAT COMMENT '(g)',
        CALORIES DECIMAL(5,0) COMMENT '(kCal (=Calories)',
		PRIMARY KEY (FOOD_ID),
        INDEX(FOOD_ID)
);

-- Database Number,Food Group,Food Name,Protein (g),Fat (g),Carbohydrates (g),Ash (g),Calories,Starch (g),Sucrose (g),Glucose (g),Fructose (g),Lactose (g),Maltose (g),Alcohol (g),Water (g),Caffeine (mg),Theobromine (mg),Sugar (g),Galactose (g),Fiber (g),Calcium (mg),Iron (mg),Magnesium (mg),Phosphorus (mg),Potasssium (mg),Sodium (mg),Zinc (mg),Cupper (mg),Fluoride (mcg),Manganese (mg),Selenium (mcg),Vitamin A (IU),Retinol (mcg),Retinol Equivalents (mcg),Beta Carotene (mcg),Alpha Carotene (mcg),Vitamin E (mg),Vitamin D (mcg),Vitamin D2 (Ergocalciferol)  (mcg),Vitamin D3 (Cholecalciferol) (mcg),Beta Cryptoxanthin (mcg),Lycopene (mcg),Lutein and Zeaxanthin (mcg),Vitamin C (mg),Thiamin (B1) (mg),Riboflavin (B2) (mg),Niacin (B3) (mg),Vitamin B5 (mg),Vitamin B6 (mg),Folate (B9) (mg),Vitamin B12,Choline (mg),Cholesterol (mg),Saturated Fat (g),Net Carbs,,