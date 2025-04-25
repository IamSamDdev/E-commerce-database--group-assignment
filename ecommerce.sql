-- Create Brand table
CREATE TABLE Brand (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100) NOT NULL
);

-- Create Product_category table
CREATE TABLE Product_category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Create Color table
CREATE TABLE Color (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL,
    hex_code VARCHAR(7) NOT NULL
);

-- Create Product_item table
CREATE TABLE Product_item (
    item_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    sku VARCHAR(50) UNIQUE NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    product_id INT,
    variation_id INT
);

-- Create Product_variation table
CREATE TABLE Product_variation (
    variation_id INT PRIMARY KEY,
    item_id INT,
    color_id INT,
    size_option_id INT,
    product_id INT,
    FOREIGN KEY (item_id) REFERENCES Product_item(item_id),
    FOREIGN KEY (color_id) REFERENCES Color(color_id)
);





-- Insert sample data into Color
INSERT INTO Color (color_id, color_name, hex_code) VALUES
(1, 'Red', '#FF0000'),
(2, 'Blue', '#0000FF'),
(3, 'Black', '#000000'),
(4, 'White', '#FFFFFF'),
(5, 'Green', '#00FF00');







-- PRODUCT
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    base_price DECIMAL(10,2),
    category_id INT,
    brand_id INT,
    FOREIGN KEY (category_id) REFERENCES product_category(category_id),
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

INSERT INTO product (name, base_price, category_id, brand_id) VALUES
('Air Max 270', 150.00, 1, 1),
('iPhone 15 Pro', 999.00, 2, 2);

-- PRODUCT ITEM
CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    sku VARCHAR(50),
    stock_quantity INT,
    product_id INT,
    variation_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);


INSERT INTO product_item (name, sku, stock_quantity, product_id, variation_id) VALUES
('Air Max 270 - Black - 42', 'SKU-AIR270-BLK-42', 50, 1, 1),
('iPhone 15 Pro - 256GB - Black', 'SKU-IPH15-256-BLK', 20, 2, 2);




-- SIZE CATEGORY
CREATE TABLE size_category (
    size_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50)
);



INSERT INTO size_category (category_name) VALUES
('Clothing Sizes'),
('Shoe Sizes');

-- SIZE OPTION
CREATE TABLE size_option (
    size_option_id INT AUTO_INCREMENT PRIMARY KEY,
    size_label VARCHAR(10),
    size_cat_id INT,
    FOREIGN KEY (size_cat_id) REFERENCES size_category(size_cat_id)
);

INSERT INTO size_option (size_label, size_cat_id) 
VALUES
('M', 1), ('L', 1), ('42', 2);



-- PRODUCT IMAGE
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255),
    item_id INT,
    FOREIGN KEY (item_id) REFERENCES product_item(item_id)
);

INSERT INTO product_image (image_url, item_id) VALUES
('https://example.com/images/airmax270_black_42.jpg', 1),
('https://example.com/images/iphone15pro_black.jpg', 2);


-- ATTRIBUTE CATEGORY
CREATE TABLE attribute_category (
    attr_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO attribute_category (category_name) VALUES
('Technical Specification'),
('Material Details');





-- ATTRIBUTE TYPE
CREATE TABLE attribute_type (
    attr_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50)
);


INSERT INTO attribute_type (type_name) VALUES
('Text'),
('Number'),
('Boolean');





-- PRODUCT ATTRIBUTE
CREATE TABLE product_attribute (
    attr_id INT AUTO_INCREMENT PRIMARY KEY,
    attr_name VARCHAR(100),
    attr_value VARCHAR(100),
    item_id INT,
    attr_cat_id INT,
    attr_type_id INT,
    FOREIGN KEY (item_id) REFERENCES product_item(item_id),
    FOREIGN KEY (attr_cat_id) REFERENCES attribute_category(attr_cat_id),
    FOREIGN KEY (attr_type_id) REFERENCES attribute_type(attr_type_id)
);



INSERT INTO product_attribute (attr_name, attr_value, item_id, attr_cat_id, attr_type_id)
 VALUES
('RAM', '8GB', 2, 1, 2),
('Storage', '256GB', 2, 1, 2),
('Waterproof', 'Yes', 1, 2, 3),
('Material', 'Mesh Upper', 1, 2, 1);










