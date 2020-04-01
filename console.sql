CREATE DATABASE book_manager;
USE book_manager;

CREATE TABLE book ( # 1 quyen sach thi se co nhieu phieu muon
    id INT AUTO_INCREMENT PRIMARY KEY ,
    book_name VARCHAR(255) NOT NULL ,
    book_publisher VARCHAR(200), /*Nha xuat ban*/
    author VARCHAR(100),
    price DOUBLE NOT NULL,
    id_category INT,
    CONSTRAINT fk_book_category FOREIGN KEY (id_category) REFERENCES category (id)
);

CREATE TABLE students_borrow_book ( # 1 sinh vien thi co nhieu phieu muon
    id INT AUTO_INCREMENT PRIMARY KEY ,
    student_name VARCHAR(155) NOT NULL ,
    date_of_birth DATE,
    address VARCHAR(200) NOT NULL ,
    phone VARCHAR(100),
    email VARCHAR(200)
);

CREATE TABLE category ( # 1 the loai thi co nhieu sach
    id INT AUTO_INCREMENT PRIMARY KEY ,
    category_name VARCHAR(100)
);

CREATE TABLE book_vouchers ( /*Phieu muon */
    id_book INT NOT NULL ,
    id_student_borrow_book INT NOT NULL ,
    PRIMARY KEY (id_book, id_student_borrow_book),
    CONSTRAINT fk_book_voucher_book FOREIGN KEY (id_book) REFERENCES book (id),
    CONSTRAINT fk_book_voucher_student_borrow_book FOREIGN KEY (id_student_borrow_book) REFERENCES students_borrow_book (id),
    start_day DATE NOT NULL ,
    end_day DATE NOT NULL
    );