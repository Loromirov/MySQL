CREATE DATABASE smartphones;

/*
 1. Создать таблицу с мобильными телефонами
*/
USE smartphones;
CREATE TABLE models
(id INT PRIMARY KEY NOT NULL,
productName VARCHAR(30) NOT NULL,
manufacturer VARCHAR(30) NOT NULL,
productCount INT NOT NULL,
price INT NOT NULL);

SELECT * FROM models;

INSERT INTO models(id, productName, manufacturer, productCount, price)

VALUES
(1, "Iphone X", "Apple", 3, 76000),
(2, "Iphone 8", "Apple", 2, 51000),
(3, "Galaxy S20","Samsung", 2, 56000),
(4, "Galaxy S23","Samsung",1, 65000),
(5, "P40 Pro","Huawei", 5, 52000);

SELECT * FROM models;

/*
2. Вывести название производителя и цену для товаров, количество которых превышает 2
*/
SELECT productName, price FROM models
WHERE productCount > 2;
/*
3. Вывести весь ассортимент товаров Samsung
*/
SELECT * FROM models 
WHERE manufacturer LIKE "Samsung";

/*
4.1 Вывести все товары с упоминанием Iphone
*/
SELECT * FROM models 
WHERE productName LIKE "Iphone%";

/*
4.2 Вывести все товары с упоминанием Samsung
*/

SELECT * FROM models 
WHERE manufacturer LIKE "Samsung";

/*
4.3 Вывести товары, в которых есть цифра "8"
*/

SELECT * FROM models 
WHERE productName LIKE "%8%";

