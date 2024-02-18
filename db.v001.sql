CREATE TABLE categories (
    category_id SERIAL NOT NULL PRIMARY KEY,
    category_name VARCHAR(255),
    description VARCHAR(255)
);

INSERT INTO
    categories (category_name, description)
VALUES
    (
        'Beverages',
        'Soft drinks, coffees, teas, beers, and ales'
    ),
    (
        'Condiments',
        'Sweet and savory sauces, relishes, spreads, and seasonings'
    ),
    (
        'Confections',
        'Desserts, candies, and sweet breads'
    ),
    ('Dairy Products', 'Cheeses'),
    (
        'Grains/Cereals',
        'Breads, crackers, pasta, and cereal'
    ),
    ('Meat/Poultry', 'Prepared meats'),
    ('Produce', 'Dried fruit and bean curd'),
    ('Seafood', 'Seaweed and fish');

CREATE TABLE customers (
    customer_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_name VARCHAR(255),
    contact_name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    postal_code VARCHAR(255),
    country VARCHAR(255)
);

INSERT INTO
    customers (
        customer_id,
        customer_name,
        contact_name,
        address,
        city,
        postal_code,
        country
    )
VALUES
    (
        'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
        'Alfreds Futterkiste',
        'Maria Anders',
        'Obere Str. 57',
        'Berlin',
        '12209',
        'Germany'
    ),
    (
        'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
        'Johns Futterkiste',
        'John Doe',
        'Obere Str. 58',
        'Berlin',
        '12209',
        'Germany'
    ),
    (
        'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
        'Janes Futterkiste',
        'Jane Doe',
        'Obere Str. 59',
        'Berlin',
        '12209',
        'Germany'
    ),
    (
        'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
        'Bobs Futterkiste',
        'Bob Builder',
        'Obere Str. 60',
        'Berlin',
        '12209',
        'Germany'
    ),
    (
        'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
        'Alice Futterkiste',
        'Alice Wonderland',
        'Obere Str. 61',
        'Berlin',
        '12209',
        'Germany'
    ),
    (
        'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
        'Charlie Futterkiste',
        'Charlie Brown',
        'Obere Str. 62',
        'Berlin',
        '12209',
        'Germany'
    ),
    (
        'a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a17',
        'David Futterkiste',
        'David Goliath',
        'Obere Str. 63',
        'Berlin',
        '12209',
        'Germany'
    ),
    (
        'b7eebc99-9c0b-4ef8-bb6d-6bb9bd380a18',
        'Edward Futterkiste',
        'Edward Scissorhands',
        'Obere Str. 64',
        'Berlin',
        '12209',
        'Germany'
    ),
    (
        'c8eebc99-9c0b-4ef8-bb6d-6bb9bd380a19',
        'Frank Futterkiste',
        'Frank Sinatra',
        'Obere Str. 65',
        'Berlin',
        '12209',
        'Germany'
    ),
    (
        'd9eebc99-9c0b-4ef8-bb6d-6bb9bd380a20',
        'George Futterkiste',
        'George Clooney',
        'Obere Str. 66',
        'Berlin',
        '12209',
        'Germany'
    ),
    (
        'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a21',
        'Harry Futterkiste',
        'Harry Potter',
        'Obere Str. 67',
        'Berlin',
        '12209',
        'Germany'
    );

CREATE TABLE products (
    product_id UUID PRIMARY KEY,
    product_name VARCHAR(255),
    category_id INT,
    unit VARCHAR(255),
    price DECIMAL(10, 2)
);

INSERT INTO
    products (
        product_id,
        product_name,
        category_id,
        unit,
        price
    )
VALUES
    (
        'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22',
        'Chai',
        1,
        '10 boxes x 20 bags',
        18.00
    ),
    (
        'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a23',
        'Chang',
        1,
        '24 - 12 oz bottles',
        19.00
    ),
    (
        'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a24',
        'Aniseed Syrup',
        2,
        '12 - 550 ml bottles',
        10.00
    ),
    (
        'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a25',
        'Chef Anton''s Cajun Seasoning',
        2,
        '48 - 6 oz jars',
        22.00
    ),
    (
        'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a26',
        'Chef Anton''s Gumbo Mix',
        2,
        '36 boxes',
        21.35
    ),
    (
        'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a27',
        'Grandma''s Boysenberry Spread',
        2,
        '12 - 8 oz jars',
        25.00
    ),
    (
        'a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a28',
        'Uncle Bob''s Organic Dried Pears',
        7,
        '12 - 1 lb pkgs.',
        30.00
    ),
    (
        'b7eebc99-9c0b-4ef8-bb6d-6bb9bd380a29',
        'Northwoods Cranberry Sauce',
        2,
        '12 - 12 oz jars',
        40.00
    );

CREATE TABLE orders (
    order_id UUID NOT NULL PRIMARY KEY,
    customer_id UUID,
    order_date DATE
);

INSERT INTO
    orders (order_id, customer_id, order_date)
VALUES
    (
        'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a40',
        'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
        '2021-01-01'
    ),
    (
        'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a41',
        'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a12',
        '2021-01-02'
    ),
    (
        'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a42',
        'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a13',
        '2021-01-03'
    ),
    (
        'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a43',
        'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a14',
        '2021-01-04'
    ),
    (
        'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a44',
        'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a15',
        '2021-01-05'
    ),
    (
        'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a45',
        'f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a16',
        '2021-01-06'
    ),
    (
        'a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a46',
        'a6eebc99-9c0b-4ef8-bb6d-6bb9bd380a17',
        '2021-01-07'
    );

CREATE TABLE order_details (
    order_detail_id UUID NOT NULL PRIMARY KEY,
    order_id UUID,
    product_id UUID,
    quantity INT
);

INSERT INTO
    order_details (order_detail_id, order_id, product_id, quantity)
VALUES
    (
        'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a50',
        'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a40',
        'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22',
        10
    ),
    (
        'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a51',
        'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a41',
        'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a23',
        20
    ),
    (
        'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a52',
        'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a42',
        'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a24',
        30
    ),
    (
        'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a53',
        'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a43',
        'd3eebc99-9c0b-4ef8-bb6d-6bb9bd380a25',
        40
    ),
    (
        'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a54',
        'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a44',
        'e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a26',
        50
    );

CREATE TABLE testproducts (
    testproduct_id SERIAL NOT NULL PRIMARY KEY,
    product_name VARCHAR(255),
    category_id INT
);

INSERT INTO
    testproducts (product_name, category_id)
VALUES
    (' Johns Fruit Cake ', 3),
    (' Marys Healthy Mix ', 1),
    (' Peters Scary Stuff ', 2),
    (' Jims Secret Recipe ', 1),
    (' Elisabeths Best Apples ', 2),
    (' Janes Favorite Cheese ', 4),
    (' Billys Home Made Pizza ', 3),
    (' Ellas Special Salmon ', 6),
    (' Roberts Rich Spaghetti ', 5),
    (' Mias Popular Ice ', 4);