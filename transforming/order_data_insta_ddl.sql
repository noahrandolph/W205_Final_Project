
DROP TABLE aisle_name;

CREATE TABLE aisle_name as
SELECT insta_aisles.aisle as aisle, insta_products.product_id as product
FROM insta_aisles JOIN  insta_products
ON insta_aisles.aisle_id = insta_products.aisle_id;


DROP TABLE insta_prior;

CREATE TABLE insta_prior as
SELECT insta_products_prior.order_id as order_id, aisle_name.aisle as product
FROM  insta_products_prior JOIN aisle_name
ON insta_products_prior.product_id = aisle_name.product;


DROP TABLE insta_train;

CREATE TABLE insta_train as
SELECT insta_products_train.order_id as order_id, aisle_name.aisle as product
FROM  insta_products_train JOIN aisle_name
ON insta_products_train.product_id = aisle_name.product;


DROP TABLE insta_orders_combined;

CREATE TABLE insta_orders_combined as
SELECT * FROM insta_prior 
UNION ALL
SELECT * FROM insta_train;


DROP TABLE i_orders_1_hot;

CREATE TABLE i_orders_1_hot as
SELECT order_id as basket_id, SUM(CASE WHEN product = 'air fresheners candles' THEN quantity ELSE NULL END) AS air_fresheners_candles,
SUM(CASE WHEN product = 'asian foods' THEN quantity ELSE NULL END) AS asian_foods,
SUM(CASE WHEN product = 'baby bath body care' THEN quantity ELSE NULL END) AS baby_bath_body_care,
SUM(CASE WHEN product = 'baby food formula' THEN quantity ELSE NULL END) AS baby_food_formula,
SUM(CASE WHEN product = 'bakery desserts' THEN quantity ELSE NULL END) AS bakery_desserts,
SUM(CASE WHEN product = 'baking ingredients' THEN quantity ELSE NULL END) AS baking_ingredients,
SUM(CASE WHEN product = 'baking supplies decor' THEN quantity ELSE NULL END) AS baking_supplies_decor,
SUM(CASE WHEN product = 'beauty' THEN quantity ELSE NULL END) AS beauty,
SUM(CASE WHEN product = 'beers coolers' THEN quantity ELSE NULL END) AS beers_coolers,
SUM(CASE WHEN product = 'body lotions soap' THEN quantity ELSE NULL END) AS body_lotions_soap,
SUM(CASE WHEN product = 'bread' THEN quantity ELSE NULL END) AS bread,
SUM(CASE WHEN product = 'breakfast bakery' THEN quantity ELSE NULL END) AS breakfast_bakery,
SUM(CASE WHEN product = 'breakfast bars pastries' THEN quantity ELSE NULL END) AS breakfast_bars_pastries,
SUM(CASE WHEN product = 'bulk dried fruits vegetables' THEN quantity ELSE NULL END) AS bulk_dried_fruits_vegetables,
SUM(CASE WHEN product = 'bulk grains rice dried goods' THEN quantity ELSE NULL END) AS bulk_grains_rice_dried_goods,
SUM(CASE WHEN product = 'buns rolls' THEN quantity ELSE NULL END) AS buns_rolls,
SUM(CASE WHEN product = 'butter' THEN quantity ELSE NULL END) AS butter,
SUM(CASE WHEN product = 'candy chocolate' THEN quantity ELSE NULL END) AS candy_chocolate,
SUM(CASE WHEN product = 'canned fruit applesauce' THEN quantity ELSE NULL END) AS canned_fruit_applesauce,
SUM(CASE WHEN product = 'canned meals beans' THEN quantity ELSE NULL END) AS canned_meals_beans,
SUM(CASE WHEN product = 'canned meat seafood' THEN quantity ELSE NULL END) AS canned_meat_seafood,
SUM(CASE WHEN product = 'cat food care' THEN quantity ELSE NULL END) AS cat_food_care,
SUM(CASE WHEN product = 'cereal' THEN quantity ELSE NULL END) AS cereal,
SUM(CASE WHEN product = 'chips pretzels' THEN quantity ELSE NULL END) AS chips_pretzels,
SUM(CASE WHEN product = 'cleaning products' THEN quantity ELSE NULL END) AS cleaning_products,
SUM(CASE WHEN product = 'cocoa drink mixes' THEN quantity ELSE NULL END) AS cocoa_drink_mixes,
SUM(CASE WHEN product = 'coffee' THEN quantity ELSE NULL END) AS coffee,
SUM(CASE WHEN product = 'cold flu allergy' THEN quantity ELSE NULL END) AS cold_flu_allergy,
SUM(CASE WHEN product = 'condiments' THEN quantity ELSE NULL END) AS condiments,
SUM(CASE WHEN product = 'cookies cakes' THEN quantity ELSE NULL END) AS cookies_cakes,
SUM(CASE WHEN product = 'crackers' THEN quantity ELSE NULL END) AS crackers,
SUM(CASE WHEN product = 'deodorants' THEN quantity ELSE NULL END) AS deodorants,
SUM(CASE WHEN product = 'diapers wipes' THEN quantity ELSE NULL END) AS diapers_wipes,
SUM(CASE WHEN product = 'digestion' THEN quantity ELSE NULL END) AS digestion,
SUM(CASE WHEN product = 'dish detergents' THEN quantity ELSE NULL END) AS dish_detergents,
SUM(CASE WHEN product = 'dog food care' THEN quantity ELSE NULL END) AS dog_food_care,
SUM(CASE WHEN product = 'doughs gelatins bake mixes' THEN quantity ELSE NULL END) AS doughs_gelatins_bake_mixes,
SUM(CASE WHEN product = 'dry pasta' THEN quantity ELSE NULL END) AS dry_pasta,
SUM(CASE WHEN product = 'eggs' THEN quantity ELSE NULL END) AS eggs,
SUM(CASE WHEN product = 'energy sports drinks' THEN quantity ELSE NULL END) AS energy_sports_drinks,
SUM(CASE WHEN product = 'eye ear care' THEN quantity ELSE NULL END) AS eye_ear_care,
SUM(CASE WHEN product = 'facial care' THEN quantity ELSE NULL END) AS facial_care,
SUM(CASE WHEN product = 'feminine care' THEN quantity ELSE NULL END) AS feminine_care,
SUM(CASE WHEN product = 'first aid' THEN quantity ELSE NULL END) AS first_aid,
SUM(CASE WHEN product = 'fresh fruits' THEN quantity ELSE NULL END) AS fresh_fruits,
SUM(CASE WHEN product = 'fresh herbs' THEN quantity ELSE NULL END) AS fresh_herbs,
SUM(CASE WHEN product = 'fresh vegetables' THEN quantity ELSE NULL END) AS fresh_vegetables,
SUM(CASE WHEN product = 'frozen appetizers sides' THEN quantity ELSE NULL END) AS frozen_appetizers_sides,
SUM(CASE WHEN product = 'frozen breads doughs' THEN quantity ELSE NULL END) AS frozen_breads_doughs,
SUM(CASE WHEN product = 'frozen breakfast' THEN quantity ELSE NULL END) AS frozen_breakfast,
SUM(CASE WHEN product = 'frozen dessert' THEN quantity ELSE NULL END) AS frozen_dessert,
SUM(CASE WHEN product = 'frozen juice' THEN quantity ELSE NULL END) AS frozen_juice,
SUM(CASE WHEN product = 'frozen meals' THEN quantity ELSE NULL END) AS frozen_meals,
SUM(CASE WHEN product = 'frozen meat seafood' THEN quantity ELSE NULL END) AS frozen_meat_seafood,
SUM(CASE WHEN product = 'frozen pizza' THEN quantity ELSE NULL END) AS frozen_pizza,
SUM(CASE WHEN product = 'frozen produce' THEN quantity ELSE NULL END) AS frozen_produce,
SUM(CASE WHEN product = 'frozen vegan vegetarian' THEN quantity ELSE NULL END) AS frozen_vegan_vegetarian,
SUM(CASE WHEN product = 'fruit vegetable snacks' THEN quantity ELSE NULL END) AS fruit_vegetable_snacks,
SUM(CASE WHEN product = 'grain' THEN quantity ELSE NULL END) AS grain,
SUM(CASE WHEN product = 'hair care' THEN quantity ELSE NULL END) AS hair_care,
SUM(CASE WHEN product = 'honeys syrups nectars' THEN quantity ELSE NULL END) AS honeys_syrups_nectars,
SUM(CASE WHEN product = 'hot cereal pancake mixes' THEN quantity ELSE NULL END) AS hot_cereal_pancake_mixes,
SUM(CASE WHEN product = 'hot dogs bacon sausage' THEN quantity ELSE NULL END) AS hot_dogs_bacon_sausage,
SUM(CASE WHEN product = 'ice cream ice' THEN quantity ELSE NULL END) AS ice_cream_ice,
SUM(CASE WHEN product = 'juice nectars' THEN quantity ELSE NULL END) AS juice_nectars,
SUM(CASE WHEN product = 'kitchen supplies' THEN quantity ELSE NULL END) AS kitchen_supplies,
SUM(CASE WHEN product = 'latino foods' THEN quantity ELSE NULL END) AS latino_foods,
SUM(CASE WHEN product = 'laundry' THEN quantity ELSE NULL END) AS laundry,
SUM(CASE WHEN product = 'lunch meat' THEN quantity ELSE NULL END) AS lunch_meat,
SUM(CASE WHEN product = 'marinades meat preparation' THEN quantity ELSE NULL END) AS marinades_meat_preparation,
SUM(CASE WHEN product = 'milk' THEN quantity ELSE NULL END) AS milk,
SUM(CASE WHEN product = 'more household' THEN quantity ELSE NULL END) AS more_household,
SUM(CASE WHEN product = 'muscles joints pain relief' THEN quantity ELSE NULL END) AS muscles_joints_pain_relief,
SUM(CASE WHEN product = 'nuts seeds dried fruit' THEN quantity ELSE NULL END) AS nuts_seeds_dried_fruit,
SUM(CASE WHEN product = 'oils vinegars' THEN quantity ELSE NULL END) AS oils_vinegars,
SUM(CASE WHEN product = 'oral hygiene' THEN quantity ELSE NULL END) AS oral_hygiene,
SUM(CASE WHEN product = 'other creams cheeses' THEN quantity ELSE NULL END) AS other_creams_cheeses,
SUM(CASE WHEN product = 'packaged cheese' THEN quantity ELSE NULL END) AS packaged_cheese,
SUM(CASE WHEN product = 'packaged meat' THEN quantity ELSE NULL END) AS packaged_meat,
SUM(CASE WHEN product = 'packaged seafood' THEN quantity ELSE NULL END) AS packaged_seafood,
SUM(CASE WHEN product = 'packaged vegetables fruits' THEN quantity ELSE NULL END) AS packaged_vegetables_fruits,
SUM(CASE WHEN product = 'paper goods' THEN quantity ELSE NULL END) AS paper_goods,
SUM(CASE WHEN product = 'pasta sauce' THEN quantity ELSE NULL END) AS pasta_sauce,
SUM(CASE WHEN product = 'pickled goods olives' THEN quantity ELSE NULL END) AS pickled_goods_olives,
SUM(CASE WHEN product = 'plates bowls cups flatware' THEN quantity ELSE NULL END) AS plates_bowls_cups_flatware,
SUM(CASE WHEN product = 'prepared meals' THEN quantity ELSE NULL END) AS prepared_meals,
SUM(CASE WHEN product = 'prepared soups salads' THEN quantity ELSE NULL END) AS prepared_soups_salads,
SUM(CASE WHEN product = 'preserved dips spreads' THEN quantity ELSE NULL END) AS preserved_dips_spreads,
SUM(CASE WHEN product = 'salad dressing toppings' THEN quantity ELSE NULL END) AS salad_dressing_toppings,
SUM(CASE WHEN product = 'seafood counter' THEN quantity ELSE NULL END) AS seafood_counter,
SUM(CASE WHEN product = 'shave needs' THEN quantity ELSE NULL END) AS shave_needs,
SUM(CASE WHEN product = 'soap' THEN quantity ELSE NULL END) AS soap,
SUM(CASE WHEN product = 'soft drinks' THEN quantity ELSE NULL END) AS soft_drinks,
SUM(CASE WHEN product = 'soup broth bouillon' THEN quantity ELSE NULL END) AS soup_broth_bouillon,
SUM(CASE WHEN product = 'soy lactosefree' THEN quantity ELSE NULL END) AS soy_lactosefree,
SUM(CASE WHEN product = 'specialty wines champagnes' THEN quantity ELSE NULL END) AS specialty_wines_champagnes,
SUM(CASE WHEN product = 'spices seasonings' THEN quantity ELSE NULL END) AS spices_seasonings,
SUM(CASE WHEN product = 'spirits' THEN quantity ELSE NULL END) AS spirits,
SUM(CASE WHEN product = 'spreads' THEN quantity ELSE NULL END) AS spreads,
SUM(CASE WHEN product = 'tea' THEN quantity ELSE NULL END) AS tea,
SUM(CASE WHEN product = 'trail mix snack mix' THEN quantity ELSE NULL END) AS trail_mix_snack_mix,
SUM(CASE WHEN product = 'trash bags liners' THEN quantity ELSE NULL END) AS trash_bags_liners,
SUM(CASE WHEN product = 'vitamins supplements' THEN quantity ELSE NULL END) AS vitamins_supplements,
SUM(CASE WHEN product = 'water seltzer sparkling water' THEN quantity ELSE NULL END) AS water_seltzer_sparkling_water,
SUM(CASE WHEN product = 'white wines' THEN quantity ELSE NULL END) AS white_wines,
SUM(CASE WHEN product = 'yogurt' THEN quantity ELSE NULL END) AS yogurt,
'0' as dataset
FROM (
 SELECT
 order_id,
 product,
 COUNT(order_id) AS quantity
 FROM insta_orders_combined
 GROUP BY order_id, product
) sub
GROUP BY order_id;


DROP TABLE i_orders;

CREATE TABLE i_orders as
SELECT
i_orders_1_hot.basket_id as basket_id,
insta_orders.order_dow as day_of_week,
insta_orders.order_hour_of_day as hour_of_day,
i_orders_1_hot.air_fresheners_candles as air_fresheners_candles,
i_orders_1_hot.asian_foods as asian_foods,
i_orders_1_hot.baby_bath_body_care as baby_bath_body_care,
i_orders_1_hot.baby_food_formula as baby_food_formula,
i_orders_1_hot.bakery_desserts as bakery_desserts,
i_orders_1_hot.baking_ingredients as baking_ingredients,
i_orders_1_hot.baking_supplies_decor as baking_supplies_decor,
i_orders_1_hot.beauty as beauty,
i_orders_1_hot.beers_coolers as beers_coolers,
i_orders_1_hot.body_lotions_soap as body_lotions_soap,
i_orders_1_hot.bread as bread,
i_orders_1_hot.breakfast_bakery as breakfast_bakery,
i_orders_1_hot.breakfast_bars_pastries as breakfast_bars_pastries,
i_orders_1_hot.bulk_dried_fruits_vegetables as bulk_dried_fruits_vegetables,
i_orders_1_hot.bulk_grains_rice_dried_goods as bulk_grains_rice_dried_goods,
i_orders_1_hot.buns_rolls as buns_rolls,
i_orders_1_hot.butter as butter,
i_orders_1_hot.candy_chocolate as candy_chocolate,
i_orders_1_hot.canned_fruit_applesauce as canned_fruit_applesauce,
i_orders_1_hot.canned_meals_beans as canned_meals_beans,
i_orders_1_hot.canned_meat_seafood as canned_meat_seafood,
i_orders_1_hot.cat_food_care as cat_food_care,
i_orders_1_hot.cereal as cereal,
i_orders_1_hot.chips_pretzels as chips_pretzels,
i_orders_1_hot.cleaning_products as cleaning_products,
i_orders_1_hot.cocoa_drink_mixes as cocoa_drink_mixes,
i_orders_1_hot.coffee as coffee,
i_orders_1_hot.cold_flu_allergy as cold_flu_allergy,
i_orders_1_hot.condiments as condiments,
i_orders_1_hot.cookies_cakes as cookies_cakes,
i_orders_1_hot.crackers as crackers,
i_orders_1_hot.deodorants as deodorants,
i_orders_1_hot.diapers_wipes as diapers_wipes,
i_orders_1_hot.digestion as digestion,
i_orders_1_hot.dish_detergents as dish_detergents,
i_orders_1_hot.dog_food_care as dog_food_care,
i_orders_1_hot.doughs_gelatins_bake_mixes as doughs_gelatins_bake_mixes,
i_orders_1_hot.dry_pasta as dry_pasta,
i_orders_1_hot.eggs as eggs,
i_orders_1_hot.energy_sports_drinks as energy_sports_drinks,
i_orders_1_hot.eye_ear_care as eye_ear_care,
i_orders_1_hot.facial_care as facial_care,
i_orders_1_hot.feminine_care as feminine_care,
i_orders_1_hot.first_aid as first_aid,
i_orders_1_hot.fresh_fruits as fresh_fruits,
i_orders_1_hot.fresh_herbs as fresh_herbs,
i_orders_1_hot.fresh_vegetables as fresh_vegetables,
i_orders_1_hot.frozen_appetizers_sides as frozen_appetizers_sides,
i_orders_1_hot.frozen_breads_doughs as frozen_breads_doughs,
i_orders_1_hot.frozen_breakfast as frozen_breakfast,
i_orders_1_hot.frozen_dessert as frozen_dessert,
i_orders_1_hot.frozen_juice as frozen_juice,
i_orders_1_hot.frozen_meals as frozen_meals,
i_orders_1_hot.frozen_meat_seafood as frozen_meat_seafood,
i_orders_1_hot.frozen_pizza as frozen_pizza,
i_orders_1_hot.frozen_produce as frozen_produce,
i_orders_1_hot.frozen_vegan_vegetarian as frozen_vegan_vegetarian,
i_orders_1_hot.fruit_vegetable_snacks as fruit_vegetable_snacks,
i_orders_1_hot.grain as grain,
i_orders_1_hot.hair_care as hair_care,
i_orders_1_hot.honeys_syrups_nectars as honeys_syrups_nectars,
i_orders_1_hot.hot_cereal_pancake_mixes as hot_cereal_pancake_mixes,
i_orders_1_hot.hot_dogs_bacon_sausage as hot_dogs_bacon_sausage,
i_orders_1_hot.ice_cream_ice as ice_cream_ice,
i_orders_1_hot.juice_nectars as juice_nectars,
i_orders_1_hot.kitchen_supplies as kitchen_supplies,
i_orders_1_hot.latino_foods as latino_foods,
i_orders_1_hot.laundry as laundry,
i_orders_1_hot.lunch_meat as lunch_meat,
i_orders_1_hot.marinades_meat_preparation as marinades_meat_preparation,
i_orders_1_hot.milk as milk,
i_orders_1_hot.more_household as more_household,
i_orders_1_hot.muscles_joints_pain_relief as muscles_joints_pain_relief,
i_orders_1_hot.nuts_seeds_dried_fruit as nuts_seeds_dried_fruit,
i_orders_1_hot.oils_vinegars as oils_vinegars,
i_orders_1_hot.oral_hygiene as oral_hygiene,
i_orders_1_hot.other_creams_cheeses as other_creams_cheeses,
i_orders_1_hot.packaged_cheese as packaged_cheese,
i_orders_1_hot.packaged_meat as packaged_meat,
i_orders_1_hot.packaged_seafood as packaged_seafood,
i_orders_1_hot.packaged_vegetables_fruits as packaged_vegetables_fruits,
i_orders_1_hot.paper_goods as paper_goods,
i_orders_1_hot.pasta_sauce as pasta_sauce,
i_orders_1_hot.pickled_goods_olives as pickled_goods_olives,
i_orders_1_hot.plates_bowls_cups_flatware as plates_bowls_cups_flatware,
i_orders_1_hot.prepared_meals as prepared_meals,
i_orders_1_hot.prepared_soups_salads as prepared_soups_salads,
i_orders_1_hot.preserved_dips_spreads as preserved_dips_spreads,
i_orders_1_hot.salad_dressing_toppings as salad_dressing_toppings,
i_orders_1_hot.seafood_counter as seafood_counter,
i_orders_1_hot.shave_needs as shave_needs,
i_orders_1_hot.soap as soap,
i_orders_1_hot.soft_drinks as soft_drinks,
i_orders_1_hot.soup_broth_bouillon as soup_broth_bouillon,
i_orders_1_hot.soy_lactosefree as soy_lactosefree,
i_orders_1_hot.specialty_wines_champagnes as specialty_wines_champagnes,
i_orders_1_hot.spices_seasonings as spices_seasonings,
i_orders_1_hot.spirits as spirits,
i_orders_1_hot.spreads as spreads,
i_orders_1_hot.tea as tea,
i_orders_1_hot.trail_mix_snack_mix as trail_mix_snack_mix,
i_orders_1_hot.trash_bags_liners as trash_bags_liners,
i_orders_1_hot.vitamins_supplements as vitamins_supplements,
i_orders_1_hot.water_seltzer_sparkling_water as water_seltzer_sparkling_water,
i_orders_1_hot.white_wines as white_wines,
i_orders_1_hot.yogurt as yogurt,
i_orders_1_hot.dataset as dataset
FROM i_orders_1_hot JOIN insta_orders
ON i_orders_1_hot.basket_id = insta_orders.order_id;
