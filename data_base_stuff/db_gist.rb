# # TABLE INFO # #
#################
PRAGMA table_info(table_name);
###
###


# How many users are there?
########

SELECT COUNT(*) FROM users;
# => 50

# What are the 5 most expensive items?
########

SELECT price FROM items ORDER BY price DESC LIMIT 5;
# => 9984 9859 9790 9390 9341

SELECT MAX(price) FROM items;
# => 9984

# What's the cheapest book? (Does that change for "category is exactly 'book'" versus "category contains 'book'"?)
#######

SELECT MIN(price) FROM items WHERE category LIKE '%books%';
# => 1496

SELECT MIN(price) FROM items WHERE category="Books";
# => 1496

# Who lives at "6439 Zetta Hills, Willmouth, WY"? Do they have another address?
##########
SELECT user_id FROM addresses WHERE street="6439 Zetta Hills";
# => 40
SELECT * FROM users WHERE ID=40
# => 40|Corrine|Little|rubie_kovacek@grimes.net

SELECT * FROM addresses WHERE user_id=40;
# => 43|40|6439 Zetta Hills|Willmouth|WY|15029
# => 44|40|54369 Wolff Forges|Lake Bryon|CA|31587

# Correct Virginie Mitchell's address to " New York, NY 12345".
##############
SELECT id FROM users WHERE first_name="Virginie";
# => 39
SELECT * FROM addresses WHERE user_id=39 AND city="New York";
# => 41|39|12263 Jake Crossing|New York|NY|10108
UPDATE addresses
SET zip=12345
WHERE user_id=39 AND city="New York";

# How many total items did we sell?
###########
SELECT COUNT(*) FROM items;

# => 100;

# Simulate buying an item by inserting a User for yourself and an Order for that User.
###########
INSERT INTO users (first_name, last_name, email)
VALUES ("Caleb","Bodtorf","caleb@e4consults.com");

INSERT INTO orders (user_id, item_id, quantity)
VALUES (51,67,35);

UPDATE orders
SET created_at=date('now')
WHERE user_id=51;
