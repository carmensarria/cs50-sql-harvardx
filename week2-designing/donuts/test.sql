-- INGREDIENTS
INSERT INTO "Ingredients" ("id", "name", "price_per_unit")
VALUES (1, 'Cocoa', 5.00);

INSERT INTO "Ingredients" ("id", "name", "price_per_unit")
VALUES (2, 'Sugar', 2.00);

INSERT INTO "Ingredients" ("id", "name", "price_per_unit")
VALUES (3, 'Flour', 1.50);

INSERT INTO "Ingredients" ("id", "name", "price_per_unit")
VALUES (4, 'Buttermilk', 3.00);

INSERT INTO "Ingredients" ("id", "name", "price_per_unit")
VALUES (5, 'Sprinkles', 1.00);

-- DONUTS
INSERT INTO "Donuts" ("id", "name", "gluten_free", "price")
VALUES (1, 'Belgian Dark Chocolate', 'No', 4.00);

INSERT INTO "Donuts" ("id", "name", "gluten_free", "price")
VALUES (2, 'Back-To-School Sprinkles', 'No', 4.00);

-- DONUTS_INGREDIENTS
INSERT INTO "Donuts_Ingredients" ("donut_id", "ingredient_id")
VALUES (1, 1);

INSERT INTO "Donuts_Ingredients" ("donut_id", "ingredient_id")
VALUES (1, 3);

INSERT INTO "Donuts_Ingredients" ("donut_id", "ingredient_id")
VALUES (1, 4);

INSERT INTO "Donuts_Ingredients" ("donut_id", "ingredient_id")
VALUES (1, 2);

INSERT INTO "Donuts_Ingredients" ("donut_id", "ingredient_id")
VALUES (2, 3);

INSERT INTO "Donuts_Ingredients" ("donut_id", "ingredient_id")
VALUES (2, 4);

INSERT INTO "Donuts_Ingredients" ("donut_id", "ingredient_id")
VALUES (2, 2);

INSERT INTO "Donuts_Ingredients" ("donut_id", "ingredient_id")
VALUES (2, 5);

-- CUSTOMERS
INSERT INTO "Customers" ("id", "first_name", "last_name")
VALUES (1, 'Luis', 'Singh');

-- ORDERS
INSERT INTO "Orders" ("id","customer_id")
VALUES (1, 1);

-- ORDERS_DONUTS
INSERT INTO "Orders_Donuts" ("order_id", "donut_id", "quantity")
VALUES (1, 1, 3);

INSERT INTO "Orders_Donuts" ("order_id", "donut_id", "quantity")
VALUES (1, 2, 2);

-- QUERIES:
-- DONUTS
SELECT * FROM "Donuts";

-- DONUT'S INGREDIENTS
SELECT "Donuts"."name", "Ingredients"."name"
FROM "Donuts_Ingredients"
JOIN "Donuts" ON "Donuts"."id" = "Donuts_Ingredients"."donut_id"
JOIN "Ingredients" ON "Ingredients"."id" = "Donuts_Ingredients"."ingredient_id"
WHERE "Donuts"."id" = 1;

-- ASK FOR COMPLETE ORDER
SELECT "Customers"."first_name",
       "Customers"."last_name",
       "Donuts"."name",
       "Orders_Donuts"."quantity"
FROM "Orders_Donuts"
JOIN "Orders" ON "Orders"."id" = "Orders_Donuts"."order_id"
JOIN "Customers" ON "Customers"."id" = "Orders"."customer_id"
JOIN "Donuts" ON "Donuts"."id" = "Orders_Donuts"."donut_id";
