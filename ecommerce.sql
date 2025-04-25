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




INSERTING SAMPLE DATA TO THE DATBLES
-- Insert sample data into Brand
INSERT INTO Brand (brand_id, brand_name) VALUES
(1, 'Nike'),
(2, 'Adidas'),
(3, 'Puma'),
(4, 'Levi''s'),
(5, 'Zara');

-- Insert sample data into Product_category
INSERT INTO Product_category (category_id, category_name) VALUES
(1, 'T-Shirts'),
(2, 'Jeans'),
(3, 'Sneakers'),
(4, 'Jackets'),
(5, 'Accessories');


-- Insert sample data into Color
INSERT INTO Color (color_id, color_name, hex_code) VALUES
(1, 'Red', '#FF0000'),
(2, 'Blue', '#0000FF'),
(3, 'Black', '#000000'),
(4, 'White', '#FFFFFF'),
(5, 'Green', '#00FF00');

-- Insert sample data into Product_item
INSERT INTO Product_item (item_id, name, sku, stock_quantity, product_id, variation_id) VALUES
(1, 'Classic T-Shirt', 'NIK-TS-001', 100, 1, 1),
(2, 'Slim Fit Jeans', 'LEV-JN-002', 75, 2, 2),
(3, 'Running Shoes', 'ADI-SN-003', 50, 3, 3),
(4, 'Bomber Jacket', 'PUM-JK-004', 30, 4, 4),
(5, 'Canvas Backpack', 'ZAR-AC-005', 60, 5, 5);

-- Insert sample data into Product_variation
INSERT INTO Product_variation (variation_id, item_id, color_id, size_option_id, product_id) VALUES
(1, 1, 3, 1, 1),  -- Black Classic T-Shirt
(2, 2, 2, 2, 2),  -- Blue Slim Fit Jeans
(3, 3, 4, 3, 3),  -- White Running Shoes
(4, 4, 1, 4, 4),  -- Red Bomber Jacket
(5, 5, 5, 5, 5);  -- Green Canvas Backpack
