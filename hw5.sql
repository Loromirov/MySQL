DROP DATABASE IF EXISTS hw_5;
CREATE DATABASE hw_5;
USE hw_5;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW v1 AS 
SELECT * FROM cars
WHERE cost <= 25000;

SELECT * FROM v1;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)

ALTER VIEW v1 AS 
SELECT * FROM cars
WHERE cost <= 30000;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)

ALTER VIEW v1 AS 
SELECT * FROM cars
WHERE name = "Skoda" OR name = "Audi";

-- 1* Получить ранжированный список автомобилей по цене в порядке возрастания

SELECT *, 
DENSE_RANK() OVER w AS `Number` 
FROM cars
WINDOW w AS (ORDER BY cost);

-- 2* Получить топ-3 самых дорогих автомобилей, а также их общую стоимость

SELECT *, 
Sum(cost) OVER w AS `Sum` 
FROM cars
WINDOW w AS (ORDER BY cost DESC)
LIMIT 3; -- Не смог придумать решение, где сумма всех авто была бы во всех строках


-- 3, 4  и 5 Задания вообще не осилил :(