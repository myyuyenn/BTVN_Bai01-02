
CREATE DATABASE bookworm_db;
USE bookworm_db;

CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_year INT CHECK (birth_year > 0),
    nationality VARCHAR(50)
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(150) NOT NULL,
    category VARCHAR(50),
    author_id INT,
    price DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (price >= 0),
    publish_year INT CHECK (publish_year > 0),
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    registration_date DATE NOT NULL DEFAULT (CURRENT_DATE)
);
-- Thêm dữ liệu cho Authors
INSERT INTO authors (full_name, birth_year, nationality)
VALUES 
('Nguyễn Nhật Ánh', 1955, 'Việt Nam'),
('Arthur Conan Doyle', 1859, 'Anh'),
('Stephen R. Covey', 1932, 'Mỹ');

-- Thêm dữ liệu cho Books
INSERT INTO books (book_name, category, author_id, price, publish_year)
VALUES
('Cho tôi xin một vé đi tuổi thơ', 'Văn học', 1, 50000, 2008),
('Mắt biếc', 'Văn học', 1, 60000, 1990),
('Sherlock Holmes: A Study in Scarlet', 'Trinh thám', 2, 80000, 1887),
('Sherlock Holmes: The Sign of Four', 'Trinh thám', 2, 85000, 1890),
('Sherlock Holmes: The Hound of the Baskervilles', 'Trinh thám', 2, 90000, 1902),
('The 7 Habits of Highly Effective People', 'Kỹ năng', 3, 120000, 1989),
('First Things First', 'Kỹ năng', 3, 110000, 1994),
('The 8th Habit', 'Kỹ năng', 3, 130000, 2004);

-- Thêm dữ liệu cho Customers
INSERT INTO customers (full_name, email, phone, registration_date)
VALUES
('Trần Văn A', 'vana@example.com', '0901234567', CURRENT_DATE),
('Nguyễn Thị B', 'thib@example.com', '0902345678', CURRENT_DATE),
('Lê Văn C', 'vanc@example.com', '0903456789', CURRENT_DATE),
('Phạm Thị D', 'thid@example.com', '0904567890', CURRENT_DATE),
('Hoàng Văn E', 'vane@example.com', '0905678901', CURRENT_DATE);

-- Thêm khách hàng mới nhưng email trùng với khách hàng đã có
INSERT INTO customers (full_name, email, phone, registration_date)
VALUES
('Nguyễn Văn F', 'vana@example.com', '0906789012', CURRENT_DATE);

-- Khi chạy lệnh cuối, hệ thống sẽ báo lỗi Duplicate entry 'vana@example.com' for key 'customers.email' vì đã thiết lập ràng buộc UNIQUE. Điều này chứng minh ràng buộc hoạt động đúng, ngăn chặn dữ liệu trùng lặp.